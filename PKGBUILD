# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=ttyd
pkgver=1.4.0
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('x86_64')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'libwebsockets-static' 'vim') # vim makedep needed for xxd binary
source=("ttyd-$pkgver.tar.gz::https://github.com/tsl0922/ttyd/archive/$pkgver.tar.gz")
sha512sums=('925eddcb1ac290d329480329abd0626837e1c402f257519638c6033dc5998d8e4777218d415fd49d8934c8f47d850eb3ba93406f4d70f841d165312d78016bce')

build() {
  cd ttyd-$pkgver
  mkdir build -p && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ttyd-$pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/ttyd/LICENSE
}

# vim:set ts=2 sw=2 et:
