# Maintainer: Peter Lamby <peterlamby@web.de>
_foldername=tbb2017_20160916oss
pkgname=lib32-intel-tbb
pkgver=2017u1
pkgrel=1
pkgdesc="32-bit multilib version of Intel's Threaded Building Blocks library"
arch=(x86_64)
license=('GPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib')
url="http://threadingbuildingblocks.org"
source=(https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/${_foldername}_src.tgz)
sha1sums=('7341672991af0675f22c1c3292fcc70d2e3cb837')

build() {
	cd "${srcdir}/${_foldername}"
	export CC="gcc"
	export CXX="g++"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	make arch=ia32
}

package() {
	cd "${srcdir}/${_foldername}/build/"
	cd `ls -a | grep release`
	
	mkdir "${pkgdir}/usr/"
	mkdir "${pkgdir}/usr/lib32/"
	cp -dpr --no-preserve=ownership *.{so,2} "${pkgdir}/usr/lib32/"
}
