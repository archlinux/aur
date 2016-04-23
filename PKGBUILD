# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='63e48e5bc40ee3db2d74b736dbc2b134cf8fc396'
pkgname=scrawpp
pkgver=0.2.1
pkgrel=1
pkgdesc="Steam Controller C++ library"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
makedepends=('cmake')
depends=('scraw')
source=("scrawpp-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scrawpp/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('57a378e08a7efb5491488c9c2c8c1a3a44a1c9c8142880588f58cec8d18eb52d')

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
