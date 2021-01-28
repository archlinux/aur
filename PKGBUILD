# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.2.1
pkgrel=0
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml" "llvm10-libs")
makedepends=("make" "crystal>=0.35.1" "shards>=0.11.0", "llvm10")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('b60430d80a5f45940fc2a5e10ffe0ab6d8e9175036f67b15bc137f6981e9d94e')

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
