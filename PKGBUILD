# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='e5b26b939db75b57c9e592aebe1396180cdd0730'
pkgname=scraw
pkgver=0.2.1
pkgrel=2
pkgdesc="Steam Controller C library"
arch=('i686' 'x86_64')
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
makedepends=('cmake' 'doxygen')
depends=('libusb')
source=("scraw-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scraw/-/archive/v$pkgver/scraw-v$pkgver.tar.gz")
sha256sums=('6b0afd0417577aad482a010b3f2754790b1e2cce59d14711dac3a0dd25afc39c')

build() {
  cd ${pkgname}-v${pkgver}
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SCRAW_INFO=ON \
    ..
  make
}

package() {
  cd ${pkgname}-v${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
