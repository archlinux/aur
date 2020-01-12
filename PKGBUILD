# Maintainer: Deian Stefan

_pkgname=btor2tools
pkgname=btor2tools-git
pkgver=r77.9831f99
pkgrel=1
pkgdesc="A generic parser and tool package for the BTOR2 format."
arch=('any')
url="https://github.com/Boolector/btor2tools"
license=('MIT')
depends=()
makedepends=()
conflicts=()
source=("git://github.com/Boolector/btor2tools.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir
}

build() {
  cd "$srcdir/btor2tools"
  CFLAGS="" ./configure.sh
  cd build
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
  mkdir -p "$pkgdir/usr/include/btor2parser"

  install -m755 btor2tools/build/bin/* "$pkgdir/usr/bin/"
  install -m755 btor2tools/build/lib/*.so "$pkgdir/usr/lib/"
  install -m755 btor2tools/src/btor2parser/btor2parser.h  "$pkgdir/usr/include/btor2parser"
}
