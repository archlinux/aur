# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elemental
pkgver=1.5.3
pkgrel=4
url="https://github.com/LLNL/Elemental"
pkgdesc="Distributed-memory dense linear algebra"
makedepends=('cmake' 'libmpc' 'gcc-fortran')
depends=('openmpi' 'lapack')
arch=('i686' 'x86_64')
license=("custom:BSD")
source=("$pkgname-$pkgver.tar.gz::https://github.com/LLNL/Elemental/archive/v$pkgver.tar.gz")
sha256sums=('faefbe738bd364d0e26ce9ad079a11c93a18c6f075719a365fd4fa5f1f7a989a')

build() {
  cmake -S Elemental-$pkgver \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr \
        -D CMAKE_BUILD_TYPE:STRING=Release \
        -D BUILD_SHARED_LIBS:BOOL=ON \
        -D __GIT_EXECUTABLE:BOOL=OFF
  make -C build
}

package() {
  DESTDIR=${pkgdir} cmake --install build
  install -Dm644 Elemental-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
