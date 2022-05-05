# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gposttl-git
pkgver=r34.4d19dda
pkgrel=2
pkgdesc="Brill's Parts-of-Speech Tagger, with built-in Tokenizer and Lemmatizer"
arch=(x86_64)
url="http://gposttl.sourceforge.net/"
license=(MIT)
depends=(glibc)
options=(!strip)
makedepends=(git autoconf)
source=("$pkgname::git+https://github.com/tonylambiris/gposttl")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
}
