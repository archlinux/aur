# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='0e7a2de02532756bc6096c5841567e5cb5b41b45'
pkgname=scd
pkgver=0.2.0
pkgrel=1
pkgdesc="Free and open source driver for the Steam Controller"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scd"
license=('custom:ISC')
makedepends=('cmake' 'scrawpp')
depends=('scraw')
source=("scd-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scd/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('c794a3b9053ce72ed0a0ad01a63bd27636466da7f5b06d5e8e3d93917f28e6f8')

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
