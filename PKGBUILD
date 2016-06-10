# Maintainer: JonnyRobbie <dzhonny at yahoo dot com>

pkgname=cmpl-bin
pkgver=1.10.0
pkgrel=2
pkgdesc="A mathematical programming language and a system for mathematical programming and optimisation of linear optimisation problems."
arch=("i686" "x86_64")
url="https://projects.coin-or.org/Cmpl"
license=('GPL3')
depends=("java-runtime" "python2" "glpk" "coin-or-cbc")
source_i686=("http://www.coliop.org/_download/Cmpl-$(echo $pkgver | sed s/\\./-/g)-linux32.tar.gz")
source_x86_64=("http://www.coliop.org/_download/Cmpl-$(echo $pkgver | sed s/\\./-/g)-linux64.tar.gz")
sha256sums_i686=('2f26a63da4b0bd9be21320c07f02c483961c1427cd87a960f5a75ab2021cbc09')
sha256sums_x86_64=('3595425b4081c8316387572c8b2cceb2d663c6984e768a8bf7d951574e413daf')

prepare() {
    sed -ri 's/\.\.\/Thirdparty\/(CBC|GLPK)/\/usr\/bin/' ${srcdir}/Cmpl/bin/cmpl.opt
    sed -ri 's/\/usr\/share\/Cmpl/\/usr\/share\/cmpl/' ${srcdir}/Cmpl/cmpl
}

package() {
	#appdata
	mkdir -p "${pkgdir}/usr/share/cmpl"
	cp -r "${srcdir}/Cmpl/." "${pkgdir}/usr/share/cmpl/"
	rm -rf "${pkgdir}/usr/share/cmpl/Thirdparty"
	#doc
	mkdir -p "${pkgdir}/usr/share/doc/cmpl"
	mv "${pkgdir}/usr/share/cmpl/doc/CMPL.pdf" "${pkgdir}/usr/share/doc/cmpl/CMPL.pdf"
	rmdir "${pkgdir}/usr/share/cmpl/doc"
	#bin symlink
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/share/cmpl/cmpl" "${pkgdir}/usr/bin/cmpl"
	#coilop
	cp "${srcdir}/Cmpl/coliop" "${pkgdir}/usr/bin"
	chmod +x "${pkgdir}/usr/bin/coliop"
	rm ${pkgdir}/usr/share/cmpl/install
}
