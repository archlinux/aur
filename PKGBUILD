# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.9.0
pkgrel=2
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha512sums=('94368a7a19b1730dab03528990308401ff74e70527dce5c209367a9bdbc76fdaa3f09f36f5fbaba4764bb43ed8778cfa0b5eb906e72b4a708324159294de260f')
b2sums=('c53bed638b849017ba3e716ac4f606b45a5b4cc29f49a57277e432787e5134bde583b3719c04660cc71b862647d4ee19903428236c2e7dc60fc7c80d505f1faf')

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
