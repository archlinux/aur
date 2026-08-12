# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.11.2
pkgrel=1
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha512sums=('44047c6336e093a6ab06ffbe621e00c0295bd66f2e8463293dd0be0b13c84040bcf07fbf1a974ca01627a958d7f99503da4a8b7424095802081a0b10a56753af')
b2sums=('215437fe2c4e5bc727748d98b5b5039daae36ae7415c1a0a56c42ab71c6d87c7d0c2f634440519eafdb8bbe5888ec011603c279f013dddb5b3a5f883284bc61d')

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING:BOOL=ON \
        -Wno-dev
  cmake --build build --config Release
}

check() {
  ctest --test-dir build --build-config Release --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
