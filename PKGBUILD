# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.9.0
pkgrel=1
pkgdesc="Oil Shell - A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.xz")
sha256sums=('c64e22a3665756ea54ea60aa983f7893501a13c2a4d1c7f73c8c76f17ea03636')

prepare() {
  mkdir -p tmp
  sed 's/TMP=${TMPDIR:-\/tmp}/TMP=..\/tmp/' -i "oil-$pkgver/configure"
}

build() {
  cd "oil-$pkgver"
  ./configure --prefix="/usr"
  make $MAKEFLAGS
}

package() {
  cd "oil-$pkgver"
  DESTDIR="$pkgdir/" ./install
}
