# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.12
pkgrel=1
pkgdesc="Oil Shell - A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.xz")
sha512sums=('c09599ef2ab00defd054bcdbb52f7f0a220a41f19f70748b8493e9324975be892a09931e5489ad2e9556b4fa6481bff038338c580e2c070136b978cdebeb13de')

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
