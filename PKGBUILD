# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=libasl
pkgver=0.1.4
pkgrel=1
pkgdesc='Multiphysics simulation software package (Advanced Simulation Library)'
arch=('i686' 'x86_64')
url='http://asl.org.il/'
license=('AGPL3')
depends=('vtk' 'libcl' 'boost')
makedepends=('cmake' 'opencl-headers')
optdepends=('libmatio: Matlab file format support (should be installed before build)')
conflicts=('libasl-git')
options=(!buildflags)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AvtechScientific/ASL/archive/v${pkgver}.tar.gz")
sha256sums=('a8ec82e7ecc05911156ce08dd3f4c571c7dbc4d0dc30950cd8130a197d66da4f')

build() {
  cd "$srcdir/ASL-$pkgver"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/ASL-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  # Add LICENSE file
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
