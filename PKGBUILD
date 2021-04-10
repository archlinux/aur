# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.8
pkgrel=1
pkgdesc="Oil Shell - A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.gz")
sha512sums=('1d0b05f4b2b66d1506e943c85cfe0c349426a3951c5bb6344e16b61c5fa7e9753aebde2fa11538e3769970075f67299f0d4582a3fbce83d24036407896973299')

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
