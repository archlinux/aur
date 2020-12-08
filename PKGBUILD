# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.1.8
pkgrel=0
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml" "llvm10-libs")
makedepends=("make" "crystal>=0.35.1" "shards>=0.11.0", "llvm10")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('ca74f222f6d59a12e50701774fd3c5a04f41fe68e53d9b7078c9908c4f2a08a5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  shards build crystalline --release --no-debug --progress -Dpreview_mt
}

check() {
  true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 bin/crystalline ${pkgdir}/usr/bin/crystalline
}
