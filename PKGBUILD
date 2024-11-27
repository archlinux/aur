# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=spla
pkgver=1.6.1
pkgrel=1
pkgdesc="Specialized Parallel Linear Algebra"
arch=(x86_64 aarch64)
url="https://github.com/eth-cscs/spla"
license=(BSD)
depends=(openmpi cblas)
makedepends=(cmake gcc-fortran ninja)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('62b51e6ce05c41cfc1c6f6600410f9549a209c50f0331e1db41047f94493e02f')

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SPLA_FORTRAN=ON \
    -D SPLA_HOST_BLAS=GENERIC \
    -G Ninja \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 $pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
