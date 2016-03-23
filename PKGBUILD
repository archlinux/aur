# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='4a95995c1fbf9927560cfee43402832087732b8a'
pkgname=scraw
pkgver=0.2.0
pkgrel=1
pkgdesc="Steam Controller C library"
arch=(i686 x86_64)
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
makedepends=('cmake' 'doxygen')
depends=('libusb')
source=("scraw-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scraw/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('f16fd502484a41ddcc2a92c72500ba2d80c7f44bfd2f1e7b9bc9672309ae8e5e')

build() {
  cd ${pkgname}-v${pkgver}-${_commit}
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SCRAW_INFO=ON \
    ..
  make
}

package() {
  cd ${pkgname}-v${pkgver}-${_commit}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
