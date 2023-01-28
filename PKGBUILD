# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

pkgname=scrawpp
pkgver=0.2.1
pkgrel=2
pkgdesc="Steam Controller C++ library"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
makedepends=('cmake')
depends=('scraw')
source=("scrawpp-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scrawpp/-/archive/v$pkgver/scrawpp-v$pkgver.tar.gz")
sha256sums=('5a692508b6ee6e321fa2ae5aa7f99bee38900caf2f634e9e212e342038ab155d')

build() {
  cd ${pkgname}-v${pkgver}
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd ${pkgname}-v${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
