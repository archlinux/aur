# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=crystalline
pkgver=0.6.0
pkgrel=1
pkgdesc="A Language Server Protocol implementation for Crystal."
arch=("x86_64")
url="https://github.com/elbywan/crystalline/"
license=("MIT")
depends=("gc" "libevent" "pcre" "libyaml" "llvm-libs")
makedepends=("make" "crystal>=1.3.0" "shards>=0.16.0" "llvm>=13.0.0" "llvm-libs>=13.0.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elbywan/crystalline/archive/v${pkgver}.tar.gz")
sha256sums=('0d15cc0208edcbfe11bb280c2dd535091003ff89016f990a123a49325f8a8f9a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  shards build crystalline --release --no-debug --progress -Dpreview_mt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 bin/crystalline ${pkgdir}/usr/bin/crystalline
}
