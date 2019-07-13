# Submitter: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd
pkgver=1.5.1
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('i686' 'x86_64' 'armv7h')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'vim') # vim needed for its xxd binary
source=("https://github.com/tsl0922/ttyd/archive/$pkgver/ttyd-$pkgver.tar.gz")
sha512sums=('64cac0a15daf5080a8cc4b7d73b55cd267ab1839f6ee9466f6af02cd110c081cb89114f1dca51ee442e8e254ebfd4d34f45607f793948bdf958e6d721d226f53')

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
