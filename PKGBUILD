# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=libasl
pkgver=0.1.6
pkgrel=1
pkgdesc='Multiphysics simulation software package (Advanced Simulation Library)'
arch=('i686' 'x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('vtk' 'libcl' 'boost' 'libmatio')
makedepends=('cmake' 'opencl-headers')
changelog='NEWS.md'
source=("$pkgname-$pkgver.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz")
sha256sums=('b35510c2a82f96237d5cc54d727922db00b71c7d6439591ff50882d08f8314d6')

prepare() {
  cd "$srcdir/ASL-$pkgver"
  mkdir -p build
  cd build
  cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_INCLUDEDIR=include \
        -DBUILD_SHARED_LIBS=ON \
        -DWITH_EXAMPLES=ON \
        -DWITH_MATIO=ON \
        -DWITH_API_DOC=OFF \
        -DWITH_TESTS=OFF
}

build() {
  cd "$srcdir/ASL-$pkgver/build"
  make
}

package() {
  cd "$srcdir/ASL-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  # Add LICENSE file
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
