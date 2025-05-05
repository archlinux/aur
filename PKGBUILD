# Maintainer: amiga23 <t.scheller@email.de>
_pkgname=oscar64
pkgname=${_pkgname}-git
pkgver=v1.31.260.r30.g8b07905
pkgrel=1
pkgdesc="Optimizing Small memory C Compiler Assembler and Runtime for C64"
arch=('x86_64')
url="https://github.com/drmortalwombat/oscar64"
license=('GPL')
#depends=()
build_depends=()
source=("git+https://github.com/drmortalwombat/oscar64")
md5sums=('SKIP')
sha256sums=('SKIP')
provides=('oscar64')
conflicts=('oscar64')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo 0.0.1
}

build() {
  cd "$srcdir/$_pkgname"
  make -C make -j8
}

package() {
  cd "$srcdir/$_pkgname"
 	install -D -m755 bin/oscar64 $pkgdir/usr/bin/oscar64
  mkdir -p $pkgdir/usr/include
 	cp -RpT include $pkgdir/usr/include/oscar64
}
