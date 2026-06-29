#Maintainer : marshdeer <marshdeer97+aur -AT- gmail -DOT- com>

pkgname="ploopy-headphones-toolbox-bin"
pkgver=0.0.8
pkgrel=1
pkgdesc="UI for configuring the Ploopy Headphones"
arch=('x86_64')
url="https://github.com/george-norton/headphones-toolbox"
license=('GPL-3.0-only')
depends=(webkit2gtk-4.1 gtk3 gdk-pixbuf2 pango cairo gdk-pixbuf2 libsoup3 glib2 gcc-libs glibc pango hicolor-icon-theme)

_name="Ploopy Headphones Toolbox"
_nameSource="Ploopy.Headphones.Toolbox"
_nameBinary="headphones-toolbox"

source=("${url}/releases/download/app-v${pkgver}/${_nameSource}_${pkgver}_amd64.deb"
        "100-ploopy-headphones.rules")
sha256sums=('dac3f219e348feffcc770bbda7499c978dbde083f09fc960105b1e08d5a993b1'
            '6adcc8dc8cf6994480bf4553de7ce5b0151560ceb6bb8b67540cba906aeebecb')
install="udev.install"
options=(!debug)

package() {
	# Extract package data
	bsdtar -xf "${srcdir}/data.tar.gz"

	# Install binary and included EQ curve
	install -Dm755 "${srcdir}/usr/bin/${_nameBinary}" "${pkgdir}/usr/bin/${_nameBinary}"
	install -Dm644 "${srcdir}/usr/lib/${_name}/resources/oratory_15.json" "${pkgdir}/usr/lib/${_name}/resources/oratory_15.json"

	# Install icons and desktop entry
	for size in "128x128" "256x256@2" "32x32"; do
		install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_nameBinary}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_nameBinary}.png"
	done
	install -Dm644 "${srcdir}/usr/share/applications/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
	
	# Install udev rule
	install -Dm644 "100-ploopy-headphones.rules" "${pkgdir}/etc/udev/rules.d/100-ploopy-headphones.rules"
}
