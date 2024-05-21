# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.8.1
pkgrel=1
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64' 'i686')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2-v2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha256sums=('21f04878bed68cb433c4341570ee2e5755f7d499d8ab550e7dc2308569dabf71')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=ON \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
