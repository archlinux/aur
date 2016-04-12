# Current Maintainer: Sean Lynch <seanl@literati.org>
pkgname=beignet-git
pkgver=Release_v1.0.0.r676.gad86ed3
pkgrel=2
pkgdesc='A GPGPU System for Intel Ivybridge GPUs'
arch=('x86_64')
url='http://cgit.freedesktop.org/beignet/'
license=('LGPL2.1')
depends=('glu' 'libsm' 'libxext' 'mesa' 'ncurses' 'ocl-icd' 'llvm')
makedepends=('clang' 'cmake' 'python2')
provides=('opencl-intel' 'opencl-headers' 'opencl-headers12')
conflicts=('beignet' 'opencl-intel' 'opencl-headers' 'opencl-headers12')
replaces=('beignet' 'opencl-intel' 'opencl-headers' 'opencl-headers12')
source=("git://anongit.freedesktop.org/beignet")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/beignet"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/beignet"
	mkdir -p "$srcdir/beignet/build"
	cd "$srcdir/beignet/build"
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
	make
}

package() {
	cd "$srcdir/beignet/build"
	make DESTDIR="$pkgdir/" install
}
