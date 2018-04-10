# Maintainer: muchweb <aleks@s-ko.net>

pkgname=tidal-music-linux-bin
_pkgname=tidal-music-linux
pkgver=1.0
pkgrel=6
pkgdesc='An electron based wrapper around the Tidal web player for Linux'
arch=('x86_64')
url='https://github.com/Bunkerbewohner/tidal-music-linux'
license=('MIT')
# ?: libxtst alsa-lib gconf libnotify gtk2 nss
depends=('pepper-flash')
makedepends=('rsync')
provides=("${_pkgname}")
source=("https://github.com/Bunkerbewohner/tidal-music-linux/releases/download/v${pkgver}/tidal-music-linux-v${pkgver}-x64.zip")
sha256sums=('SKIP')

package() {
	rm -rf "${srcdir}/${_pkgname}-v${pkgver}/resources/app/.git"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mv "${srcdir}/${_pkgname}-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	rsync --archive "${srcdir}/${_pkgname}-v${pkgver}/" "${pkgdir}/usr/share/${pkgname}"
	chmod -R a+r "${pkgdir}/usr/share/${pkgname}"
	find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod a+x {} \;

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
