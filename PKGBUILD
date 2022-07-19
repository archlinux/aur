# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub-git
pkgver=0.4.14
pkgrel=1
pkgdesc="MDBook EPUB Backend"
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MIT)
makedepends=(git rust cargo)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(mdbook-epub)
provides=(mdbook-epub=${pkgver%+*})

pkgver() {
  cd mdbook-epub
  git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd mdbook-epub
  cargo build --release
}

package() {
  cd mdbook-epub
  install -Dm 755 target/release/mdbook-epub "$pkgdir"/usr/bin/mdbook-epub
}
