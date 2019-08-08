# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'aocc-compiler-${pkgver}.tar' required from upstream

pkgname=aocc
pkgver=2.0.0
pkgrel=1
pkgdesc="AMD Optimizing C/C++ Compiler"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocc/"
source=("file://aocc-compiler-${pkgver}.tar")
options=('staticlibs' '!strip' 'libtool')
install=aocc.install
md5sums=("09d64260794b40901c77504317fbd0ad")

package() {
	mkdir -p ${pkgdir}/opt/aocc

	cp -r ${srcdir}/aocc-compiler-${pkgver}/* ${pkgdir}/opt/aocc

	rm ${pkgdir}/opt/aocc/install.sh

	ln -s /opt/aocc/bin/clang ${pkgdir}/opt/aocc/bin/aocc

	echo "export PATH=/opt/aocc/bin:\$PATH" > ${pkgdir}/opt/aocc/setenv_aocc.sh
	echo "export LIBRARY_PATH=/opt/aocc/lib:/opt/aocc/lib32:/usr/lib:/usr/lib32:\$LIBRARY_PATH" >> ${pkgdir}/opt/aocc/setenv_aocc.sh
	echo "export LD_LIBRARY_PATH=/opt/aocc/lib:/opt/aocc/lib32:/usr/lib:/usr/lib32:\$LD_LIBRARY_PATH" >> ${pkgdir}/opt/aocc/setenv_aocc.sh
	echo "export C_INCLUDE_PATH=\$C_INCLUDE_PATH:/opt/aocc/include" >> ${pkgdir}/opt/aocc/setenv_aocc.sh
	echo "export CPLUS_INCLUDE_PATH=\$CPLUS_INCLUDE_PATH:/opt/aocc/include" >> ${pkgdir}/opt/aocc/setenv_aocc.sh
}
