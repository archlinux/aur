# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.4.0
pkgrel=1
url="https://github.com/LLNL/Elemental"
pkgdesc="distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=()
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('c13374ff4a6c4d1076e47ba8c8d91a7082588b9958d1ed89cffb12f1d2e1452e')
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
