# Original Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Current Maintainer: Leopold Bloom <blinxwang@gmail.com>
pkgname=beignet
pkgver=1.1.0
pkgrel=1
pkgdesc='A GPGPU System for Intel Ivybridge GPUs'
arch=('x86_64')
url='http://cgit.freedesktop.org/beignet/'
license=('LGPL2.1')
depends=('glu' 'libsm' 'libxext' 'mesa' 'ncurses' 'ocl-icd' 'llvm')
makedepends=('clang' 'cmake' 'python2')
provides=('opencl-intel' 'opencl-headers' 'opencl-headers12')
conflicts=('opencl-intel' 'opencl-headers' 'opencl-headers12')
replaces=('opencl-intel' 'opencl-headers' 'opencl-headers12')
source=("https://01.org/sites/default/files/beignet-$pkgver-source.tar.gz")
sha256sums=('4afe09ea13cd7f8475b9f6534e97cb4dcd307c602095c6968b0ed22290753386')

build() {
	mkdir -p "$srcdir/Beignet-$pkgver-Source/build"
	cd "$srcdir/Beignet-$pkgver-Source/build"
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
	make
}

package() {
	cd "$srcdir/Beignet-$pkgver-Source/build"
	make DESTDIR="$pkgdir/" install
}
