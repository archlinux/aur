pkgname=vxl
pkgver=3.3.2
pkgrel=1
pkgdesc="VXL (the Vision-something-Libraries): a multi-platform collection of C++ software libraries for Computer Vision and Image Understanding. "
arch=('i686' 'x86_64')
url='https://github.com/vxl/vxl'
depends=('libgeotiff')
makedepends=('cmake')
source=(https://github.com/vxl/vxl/archive/v${pkgver}.tar.gz)
md5sums=('589cdbb5b4c9e6c1203dcbb707527c59')

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

