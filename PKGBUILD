# Maintainer: Harry Jeffery <me@harry.pm>

pkgname=libgrapheme-git
pkgver=r87.39d896e
pkgrel=1
pkgdesc="grapheme cluster utility library"
url="https://libs.suckless.org/libgrapheme/"
license=("ISC")
arch=("x86_64")
makedepends=("git")
provides=("libgrapheme")
conflicts=("libgrapheme")
source=("libgrapheme-git::git://git.suckless.org/libgrapheme")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr all
}

check() {
  cd "${pkgname}"
  make PREFIX=/usr test
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
