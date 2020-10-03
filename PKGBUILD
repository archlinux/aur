# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.1
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=("x86_64" "i686")
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.gz")
sha256sums=('d2ebfe83b5ea1c3fbc77cb90241cab6115d2152f61b53db3c8f39bbff73be1da')

prepare() {
  mkdir -p tmp
  sed 's/TMP=${TMPDIR:-\/tmp}/TMP=..\/tmp/' -i "oil-$pkgver/configure"
}

build() {
  cd "oil-$pkgver"
  ./configure --prefix="$pkgdir/usr"
  make $MAKEFLAGS
}

package() {
  cd "oil-$pkgver"
  ./install
}
