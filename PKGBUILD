# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gposttl-git
pkgver=r33.b8d425d
pkgrel=1
pkgdesc="Brill's Parts-of-Speech Tagger, with built-in Tokenizer and Lemmatizer"
arch=(x86_64)
url="http://gposttl.sourceforge.net/"
license=(MIT)
depends=(glibc)
makedepends=(git autoconf)
source=("$pkgname::git+https://github.com/tonylambiris/gposttl")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname

  autoreconf -ivf
  ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
}
