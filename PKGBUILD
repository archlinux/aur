# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.5.0
pkgrel=1
url="https://github.com/LLNL/Elemental"
pkgdesc="Distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=()
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('03dd487fb23b9fdbc715554a8ea48c3196a1021502e61b0172ef3fdfbee75180')
options=('!makeflags')
  
build() {
  cd Elemental-$pkgver
  mkdir -p build && pushd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd Elemental-$pkgver/build
  make install DESTDIR="$pkgdir"
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
