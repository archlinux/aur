pkgname=vxl
pkgver=2.0.2
pkgrel=1
pkgdesc="VXL library. The geometry and imaging core libraries are turned off in order to build successfully. "
arch=('i686' 'x86_64')
url='https://github.com/vxl/vxl'
depends=('cmake')
source=(https://github.com/vxl/vxl/archive/v${pkgver}.tar.gz)
md5sums=('24fb616a55c885e821c9a049ae1b23ed')

build() {
	cd "$srcdir/vxl-${pkgver}"
	mkdir -p build
	cd build
	cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
	ncores=$(grep -c '^processor' /proc/cpuinfo)
	make -j$ncores
}

package() {
	cd "$srcdir/vxl-${pkgver}/build"
	make DESTDIR="$pkgdir" install
}

