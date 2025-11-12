# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.11.0
pkgrel=1
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha512sums=('89f3e83dbaf925f7690c11a553c402c3cadda2d33c3f94f25096b11708f9f8753a3f4ef64d632c553399e95467e887fc37972be94fcad74c63de989ad3a1dde4')
b2sums=('9d6c3481f8f403bbd0b991cef6cf7fd82dd4ee830086edee3be44393560a051ca8f8ffbd1d22e3d50098b8c396015bfead9f38001a6c77e6423e40772b091fd6')

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
