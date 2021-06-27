# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belr
pkgver=4.5.22
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=("bctoolbox>=$pkgver")
makedepends=('cmake')
source=("belr-$pkgver.tar.gz::https://github.com/BelledonneCommunications/belr/archive/$pkgver.tar.gz")
sha256sums=('980ae1125428b8c4947b0e6610dfca864648e915ba190b6f0a940234e5d5a55e')

build() {
  cmake -B build $pkgname-$pkgver \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC=NO \
    -DENABLE_TOOLS=NO \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
