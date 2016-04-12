# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='e93a2481c8630d7901b679ab666f6c61b74f6bf9'
pkgname=scrawpp
pkgver=0.2.0
pkgrel=1
pkgdesc="Steam Controller C++ library"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
makedepends=('cmake')
depends=('scraw')
source=("scrawpp-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scrawpp/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('4c313d04f8f719538128bac9783b2c413237d3f15297426093c13c8729d2c745')

build() {
  cd ${pkgname}-v${pkgver}-${_commit}
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd ${pkgname}-v${pkgver}-${_commit}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
