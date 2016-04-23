# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='e5b26b939db75b57c9e592aebe1396180cdd0730'
pkgname=scraw
pkgver=0.2.1
pkgrel=1
pkgdesc="Steam Controller C library"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
makedepends=('cmake' 'doxygen')
depends=('libusb')
source=("scraw-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scraw/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('fec3f5e3503b1fba5c2905d52c9f56f9611deb2fdfdc592bcf598be2a9f2bc76')

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
