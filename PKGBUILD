# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=libasl
pkgver=0.1.5
pkgrel=2
pkgdesc='Multiphysics simulation software package (Advanced Simulation Library)'
arch=('i686' 'x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('vtk' 'libcl' 'boost' 'libmatio')
makedepends=('cmake' 'opencl-headers')
conflicts=('libasl-git')
options=(!buildflags)
changelog='NEWS.md'
source=("$pkgname-$pkgver.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz")
sha256sums=('c90be05a6f0b5c7bf12a9630355838e86edf8e2199a238b44b042147d85dfb18')

build() {
  cd "$srcdir/ASL-$pkgver"
  mkdir -p build
  cd build
  cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        -DWITH_EXAMPLES=ON \
        -DWITH_MATIO=ON \
        -DWITH_API_DOC=OFF \
        -DWITH_TESTS=OFF
  make
}

package() {
  cd "$srcdir/ASL-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  # Add LICENSE file
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
