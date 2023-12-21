# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.5.3
pkgrel=1
url="https://github.com/LLNL/Elemental"
pkgdesc="Distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=()
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('faefbe738bd364d0e26ce9ad079a11c93a18c6f075719a365fd4fa5f1f7a989a')
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
