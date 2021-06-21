# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=ambpack
pkgver=20201217
pkgrel=2
pkgdesc='AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation '
url='http://ambook.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
source=("http://amb.osdn.io/archiwum/${pkgname}-${pkgver}.tar.xz")
sha512sums=('e297f638bed9239b7fcd58dd288ab720c44f25adfe73c76142573b328d8b4a3682fd03033ced620d38a6a490293309e1a84b7c7d95ce2a3c43a6243237856ba4')
build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make 
}

prepare() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	sed -n '/.*LICENSE.*/,$p' ${pkgname}.txt > LICENSE
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	mv ${pkgname}	${pkgdir}/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
