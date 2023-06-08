# Maintainer: Peter Gaede <peter-gaede@mail.de>

pkgname=softmaker-office-2021
_ver=2021
_rev=1064
pkgver=${_ver}.${_rev}
pkgrel=3
pkgdesc="Proprietary office suite, consisting of word processing, spreadsheet and presentation software."
url="https://www.softmaker.com"
arch=('x86_64')
license=('custom')
depends=('curl' 'hicolor-icon-theme' 'libglvnd' 'libxmu' 'libxrandr')
source=("https://www.softmaker.net/down/${pkgname}_${_rev}-01_amd64.deb" "postinst.sh" "prerm.sh")
sha256sums=('bed57a21e3c97cdab9834fc32fa1e52bdc376afd8f7c41484c2bfba135ddaaca' '9a1edbc26e061b25572c622e401875b6bd1e0e268597924f012d3bd488262f9a' 'd0b1b5be2578c4f20564fafade3505e0e7a45a0f79b23196e5b205574305696e')
install=softmaker.install

build() {
	cd ${srcdir}
	tar xf data.tar.xz
}

package() {
	cd "${srcdir}"
	
	find usr/bin -type f -exec install -D -m 744 {,${pkgdir}/}{} \;
	find usr/lib -type f -exec install -D -m 644 {,${pkgdir}/}{} \;
	find usr/share -type f -exec install -D -m 644 {,${pkgdir}/}{} \;
	
	install -Dm744 "postinst.sh" "${pkgdir}/usr/share/office${_ver}/postinst.sh"
	install -Dm744 "prerm.sh" "${pkgdir}/usr/share/office${_ver}/prerm.sh"
	
  	install -Dm644 "${srcdir}/usr/share/office${_ver}/mime/xdg-utils/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

