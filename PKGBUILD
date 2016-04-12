# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='0e55e1092d97ef793064561d27eb078b277ac4cb'
pkgname=scd
pkgver=0.1.0
pkgrel=1
pkgdesc="Free and open source driver for the Steam Controller"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scd"
license=('custom:ISC')
makedepends=('cmake' 'scrawpp')
depends=('scraw')
source=("scd-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scd/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('a9967c8b51f899e7039d500dce7c3cfc4add271d3d7700259a2ea16977c71cde')

build() {
  cd ${pkgname}-v${pkgver}-${_commit}
  mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd ${pkgname}-v${pkgver}-${_commit}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ../tinytoml/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE_tinytoml
}
