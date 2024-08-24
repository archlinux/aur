#Maintainer : marshdeer <marshdeer97+aur -AT- gmail -DOT- com>

pkgname="ploopy-headphones-toolbox-bin"
pkgver=0.0.6
pkgrel=1
pkgdesc="UI for configuring the Ploopy Headphones"
arch=('x86_64')
url="https://github.com/george-norton/headphones-toolbox"
license=('GPL-3.0-only')
depends=(webkit2gtk gtk3 gdk-pixbuf2 pango cairo gdk-pixbuf2 libsoup glib2 gcc-libs glibc pango hicolor-icon-theme)
_name="ploopy-headphones-toolbox"
source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb"
	"100-ploopy-headphones.rules"
	"ploopy-headphones-toolbox.desktop")
sha256sums=('884dcada5995b936ec3a113d6f758a15112b138485c5aef761bc5c1254d4734b'
            '6adcc8dc8cf6994480bf4553de7ce5b0151560ceb6bb8b67540cba906aeebecb'
            '18bbb22b0edfc97b0012b793a53910a348c978aa562c9a5723a45d9c97d8324e')
install="udev.install"
options=(!debug)

package() {
	# Extract package data
	bsdtar -xf "${srcdir}/data.tar.gz"

	# Install binary and included EQ curve
	install -Dm755 "${srcdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 "${srcdir}/usr/lib/${_name}/resources/oratory_15.json" "${pkgdir}/usr/lib/${_name}/resources/oratory_15.json"

	# Install icons and desktop entry
	for size in "128x128" "256x256@2" "32x32"; do
		install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}/apps/${_name}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${_name}.png"
	done
	install -Dm644 "ploopy-headphones-toolbox.desktop" "${pkgdir}/usr/share/applications/ploopy-headphones-toolbox.desktop"
	
	# Install udev rule
	install -Dm644 "100-ploopy-headphones.rules" "${pkgdir}/etc/udev/rules.d/100-ploopy-headphones.rules"
}
