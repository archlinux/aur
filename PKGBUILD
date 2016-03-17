# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

pkgname=scraw
pkgver=0.1.0
pkgrel=1
pkgdesc="Steam Controller C library"
arch=(i686 x86_64)
url="https://gitlab.com/dennis-hamester/scraw"
license=('custom:ISC')
makedepends=('cmake' 'doxygen')
depends=('libusb')
source=("scraw-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/scraw/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('00feb3e4e954df9240dce10402453e5d5c5fe04d4d52e2535662265d0416d71a')

build() {
  cd $pkgname-v$pkgver-*
  mkdir build && cd build
  echo `pwd`
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SCRAW_INFO=ON \
    ..
  make
}

package() {
  cd $pkgname-v$pkgver-*/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir"/$pkgname-v$pkgver-*/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
