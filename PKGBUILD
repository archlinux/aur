# Maintainer: fecet <xiezej@gmail.com>
pkgname=worklink
pkgver=4.3.3
_build=2253
_commit=55e83b
pkgrel=2
pkgdesc="招商随行"
arch=('x86_64')
url="https://www.cm-worklink.com"
license=('custom')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs')
optdepends=('libappindicator-gtk3')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cos-cdn.cm-worklink.com/hk-gm-cmuop-ceph-steadiness-bucket/${pkgname}_${pkgver}-${_build}-${_commit}_linux-all-amd64.deb"
        "${pkgname}.sh")
sha512sums=('65ff26c1b1d7f332728b92db80a72ea4e172ed06676c37eff62f964ef3975aeeef2a5e5f1ba6f1b4f809c8428250832e8df884d12aa330b862c864fde29e75a0'
            'SKIP')

package(){
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/招商随行/resources/extra_resources/lib/wemeetSDK/Release/raw/ytface_license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Wrapper that injects IME env vars and forces XWayland for fcitx5 support
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Route .desktop launches through the wrapper too
	sed -i 's|"/opt/招商随行/worklink"|/usr/bin/worklink|' \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
