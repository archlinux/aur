# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.5.3
pkgrel=3
url="https://github.com/LLNL/Elemental"
pkgdesc="Distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=('openmpi' 'lapack')
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('faefbe738bd364d0e26ce9ad079a11c93a18c6f075719a365fd4fa5f1f7a989a')
options=('!makeflags')

build() {
  cmake -S Elemental-$pkgver \
        -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -D__GIT_EXECUTABLE=OFF
  cmake --build build --parallel
}

package() {
  DESTDIR=${pkgdir} cmake --install build
  install -Dm644 Elemental-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
