# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.10.3
pkgrel=1
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha512sums=('bd60e2a980529361ac9cf240ce5b0bb529bd973b9e4ef85642ed7ed842a58ec9c947a75f1d6dc43df8dd9814f885940cf0b30f1dfb77170e2055539032cf47b3')
b2sums=('28f8af785767c5b40624b8951e7b3fb9ef001925aac73b46161be581e371d02a86927033b954055dde2be3cc86e87c458fbf4b765c8ed4d91906c15cf79a97df')

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
