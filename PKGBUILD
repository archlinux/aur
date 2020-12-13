# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=ambpack
pkgver=20201210
pkgrel=1
pkgdesc='AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation '
url='http://ambook.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
makedepends=('tar' 'make' 'gcc' 'sed') 
source=("http://ambook.sourceforge.net/archiwum/${pkgname}-${pkgver}.tar.xz")
sha512sums=('603fc73ae3d9dbafbd25cd0d8cf9243fb7271829b1ecf1a8bc07563b84270c945429eb55f96017256c1c7308b118e6563befdf8468350e7d083c58c4fa95edc7')
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
