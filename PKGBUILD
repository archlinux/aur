pkgname=vxl
pkgver=3.5.0
pkgrel=1
pkgdesc="VXL (the Vision-something-Libraries): a multi-platform collection of C++ software libraries for Computer Vision and Image Understanding. "
arch=('i686' 'x86_64')
url='https://github.com/vxl/vxl'
depends=('libgeotiff')
makedepends=('cmake')
source=(https://github.com/vxl/vxl/archive/v${pkgver}.tar.gz)
sha256sums=('f044d2a9336f45cd4586d68ef468c0d9539f9f1b30ceb4db85bd9b6fdb012776')

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

