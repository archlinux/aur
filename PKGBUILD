# Maintainer: Franck STAUFFER <franck.stauffer@monaco.mc>
# Contributor: timetoplatypus <timetoplatypus@protonmail.com>
# Contributor: andychu <andy@oilshell.org>

pkgname=osh
pkgver=0.8.10
pkgrel=1
pkgdesc="Oil Shell - A bash-compatible UNIX shell written in Python."
arch=('any')
url="https://www.oilshell.org/"
license=("Apache")
options=(!strip)
optdepends=("readline: interactive features")
source=("https://www.oilshell.org/download/oil-$pkgver.tar.gz")
sha512sums=('d53036cfa48b8c131b46320b80fd3410d6441ecafb3b3093d269f9ae45bc9fe0aaad1545c77488c4b60f6e1412b0191d84056c36d3ab6b49a69c176e89b32270')

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
