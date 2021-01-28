# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.7
pkgrel=1
pkgdesc="A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.gz")
sha512sums=('693b1de1dd2999463dc3105198a6c281e29075a9c5e0a3584dba33a148ce9da2c189dd2fe48c4357780fea95046d6bc2dd3cdad6767f0536bc31ee109901abd2')

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
