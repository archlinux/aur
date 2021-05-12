# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime
pkgver=4.5.13
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver" 'soci>=4.0.0')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BelledonneCommunications/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('41a32b19b1b49e64f75ed68c58d71b0d09ed813238affb774c5a3fcd92668c23')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC="NO" \
    -DENABLE_UNIT_TESTS=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
