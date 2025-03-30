# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=osqp-eigen
pkgver=0.10.0
pkgrel=1
pkgdesc="Simple Eigen-C++ wrapper for OSQP library"
arch=('x86_64')
url='https://robotology.github.io/osqp-eigen'
license=("BSD-3-Clause")
makedepends=('cmake')
depends=('eigen' 'osqp')
checkdepends=('catch2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robotology/osqp-eigen/archive/v$pkgver.tar.gz")
sha512sums=('3cd97e8dda98107c1dc7de884acc1f677a6aee6cbccea77afdf74edd774578403ae78325a1a700d249c0c60a33584c47d200e47af3cc2f3156800e1b6fe957ff')
b2sums=('d8063543d1c5d69967747e67760be296c33f0404769be9929d77ac979d16a81bee295d7f2fb3e3ca1230bf4019a028ef02885c71d3157796e43e3d7683da44d6')

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
