# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.5.1
pkgrel=1
url="https://github.com/LLNL/Elemental"
pkgdesc="Distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=()
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('447da564278f98366906d561d9c8bc4d31678c56d761679c2ff3e59ee7a2895c')
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
