# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub-git
pkgver=0.3.0+12.g640a81209b
pkgrel=1
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MIT)
makedepends=(rust cargo)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(mdbook-epub)
provides=(mdbook-epub=${pkgver%+*})

pkgver() {
  cd mdbook-epub
  git describe --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd mdbook-epub
  cargo build --release
}

package() {
  cd mdbook-epub
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
