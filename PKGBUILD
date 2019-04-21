# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.4.4
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('x86_64')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
source=("https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('7b48942e7cb9c16d91de9d8d7a39736128de6ca02a1fdef4dd8b118e8436878fdc6d2809e259a980d5760e474e3be6b02e8b4759f565404505289651324c2597')

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
