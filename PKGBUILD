# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=ttyd
pkgver=1.4.2
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('x86_64')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
source=("https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('0caff3d3602c5baa7b8f277d4190e1053e66dcfd6b4d62bcfb6fd78522734a4fbc1578cd159bee796c05bf67a4155ab0283ca4e17572e1bc8508b863adc803ed')

build() {
  cd ttyd-$pkgver
  mkdir build -p && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ttyd-$pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 -t "$pkgdir"/usr/share/licenses/ttyd ../LICENSE
}

# vim:set ts=2 sw=2 et:
