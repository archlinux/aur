# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Qontinuum <qontinuum@artixlinux.org>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.9.3
pkgrel=1
pkgdesc="Oil Shell - A bash-compatible UNIX shell written in Python"
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.xz")
sha256sums=('62f36072f69f3378e03b79d8d5255c1d136094ec11410db4f16ee82f1660efda')

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
