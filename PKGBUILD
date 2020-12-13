# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=amb
pkgver=20201205
pkgrel=1
pkgdesc='AMB stands for Ancient Machines Book. It is an extremely lightweight file format meant to store any kind of hypertext documentation '
url='http://ambook.sourceforge.net/'
license=('MIT')
arch=('x86_64' 'aarch64')
conflicts=(${pkgname}-svn)
makedepends=('tar' 'make' 'gcc' 'sed') 
source=("http://ambook.sourceforge.net/archiwum/${pkgname}-${pkgver}.tar.xz")
sha512sums=('9f5ca3aa2429995ce6942a4e8de6f451f0fec397cae4df71989eebae080a085894c1d59d59e19539393c85240d83e839c1adac5369046e0d4d7738033e9a196a')
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
