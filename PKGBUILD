# Maintainer: Thomas Pointhuber <thomas.pointhuber@gmx.at>
pkgname=limboole
pkgver=1.1
pkgrel=1
pkgdesc="A simple tool for checking satisfiability respectively tautology on arbitrary structural formulas."
arch=('i686' 'x86_64')
url="http://fmv.jku.at/limboole/"
license=('MIT') # binary falls under the license from picosat
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://fmv.jku.at/limboole/$pkgname$pkgver.tar.gz"
        "http://fmv.jku.at/picosat/picosat-960.tar.gz")
noextract=()
sha256sums=('fbf54fdfa7b6bd11c8e8246ba4367ff50287b6db264b0b3b39796c7c71855fe4'
            'edb3184a04766933b092713d0ae5782e4a3da31498629f8bb2b31234a563e817')

build() {
  # build picosat for static binding
  rm -rf "picosat"
  mv "picosat-960" "picosat"
  cd "picosat"
  ./configure
  make
  
  # build limboole
  cd "../$pkgname$pkgver"
  ./configure.sh
  make
}

check() {
  cd "$pkgname$pkgver"
  ./testlimboole
}

package() {
  cd "$pkgname$pkgver"
  install -d "$pkgdir/usr/bin"
  cp limboole "$pkgdir/usr/bin/limboole"
}
