# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='09a158cd84fa482c31b5b170ee28bbf7a5269317'
pkgname=scrawpp
pkgver=0.1.0
pkgrel=1
pkgdesc="Steam Controller C++ library"
arch=('any')
url="https://gitlab.com/dennis-hamester/scrawpp"
license=('custom:ISC')
makedepends=('cmake')
depends=('scraw')
source=("scrawpp-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scrawpp/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('a4712b7da69327654584dcb0168f52f8d8ae4773c6a042eb357723f4b53a67cd')

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
