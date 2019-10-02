# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'aocc-compiler-${pkgver}.tar' required from upstream

pkgname=aocc
pkgver=2.0.0
pkgrel=3
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocc/"
source=("local://aocc-compiler-${pkgver}.tar" "local://modulefile")
options=('staticlibs' '!strip' 'libtool')
depends=('ncurses5-compat-libs' 'env-modules')
install=aocc.install
md5sums=("09d64260794b40901c77504317fbd0ad" "SKIP")

package() {
	mkdir -p ${pkgdir}/opt/aocc

	cp -r ${srcdir}/aocc-compiler-${pkgver}/* ${pkgdir}/opt/aocc

	# modulefile
	cp modulefile ${pkgdir}/opt/aocc
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s /opt/aocc/modulefile ${pkgdir}${MODULESHOME}/modulefiles/aocc

	# Not needed
	rm ${pkgdir}/opt/aocc/install.sh

	# aocc symlink
	ln -s /opt/aocc/bin/clang ${pkgdir}/opt/aocc/bin/aocc
}
