# Maintainer: Peter Lamby <peterlamby@web.de>
_pkgname=intel-tbb
pkgname=lib32-${_pkgname}
pkgver=4.3u6
pkgrel=1
pkgdesc="32-bit multilib version of Intel's Threaded Building Blocks library"
arch=(x86_64)
license=('GPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib')
url=(http://threadingbuildingblocks.org)
source=(https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb43_20150611oss_src.tgz)
sha1sums=('5457cd15ad13625442283e67844199a79e88a3a4')

_foldername=tbb43_20150611oss

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
