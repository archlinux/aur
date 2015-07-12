# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>

pkgname=ocaml-otk
pkgver=0.6.1
pkgrel=1
pkgdesc="A bleeding edge fork of lablTk to implement new features of Tk."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/otk"
license=('LGPL')
depends=()
makedepends=('tcl' 'tk' 'ocaml>=4.0')
source=(http://forge.ocamlcore.org/frs/download.php/1515/otk-$pkgver.tar.gz)
md5sums=('cc1691a5a524f1c44b65edce5adc55be')

build() {
  cd "$srcdir/otk"
  make
  make opt
}

package() {
  mkdir -p "$pkgdir/usr/lib/ocaml/stublibs"
  mkdir "$pkgdir/usr/bin"
  cd "$srcdir/otk"
  make BINDIR="$pkgdir/usr/bin" STUBLIBDIR="$pkgdir/usr/lib/ocaml/stublibs" INSTALLDIR="$pkgdir/usr/lib/ocaml/otk" install
  make BINDIR="$pkgdir/usr/bin" STUBLIBDIR="$pkgdir/usr/lib/ocaml/stublibs" INSTALLDIR="$pkgdir/usr/lib/ocaml/otk" installopt
  install -Dm 644 compiler/copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
