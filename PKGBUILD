# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.5
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.gz")
sha512sums=('b41f43e8b2e5008dc8625aa06057beca920ab2917c7acec8965d8ff4211a69756a58f4aa74faf603809d0af3038daa4f5441b397bee7b003accf72224081298b')

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
