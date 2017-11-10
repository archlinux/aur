# Maintainer: Billy Rond <billy dot rond at gmail dot com>
# Maintainer: Previously Michal Kowalski <kowalski TOD michal TA gmail TOD com>

pkgname=gaviewer
_rpkgname=GAViewer
pkgver=0.86
pkgrel=3
epoch=
pkgdesc="Geometric Algebra scriptable 3D visualization tool"
arch=('x86_64')
url="http://www.geometricalgebra.net/downloads.html"
license=('GPL2')
groups=('ypb' 'math')
depends=('fltk' 'libgl' 'mesa' 'libx11' 'libpng' 'gcc-libs')
makedepends=('antlr2' 'zlib')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://www.geometricalgebra.net/downloads/${_rpkgname}-$pkgver.tar.gz
        http://www.geometricalgebra.net/downloads/figures.zip
        http://www.geometricalgebra.net/downloads/gaviewer.pdf
        http://www.geometricalgebra.net/downloads/gaviewerexercises.pdf)
noextract=()
md5sums=('ce5285dfa74db56a4ba7577a1a5e6738'
         '172fc88d38e3b29960e33788a1a4f045'
         '43fd8ca7da3e0cac3fee2350d05c9d3e'
         '60543f7f310292e9c70e9d98dd095c9e')

build() {
  cd "$srcdir/${_rpkgname}-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${_rpkgname}-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp $srcdir/gaviewer.pdf $srcdir/gaviewerexercises.pdf \
    "$pkgdir/usr/share/doc/$pkgname/"
  chmod -x $srcdir/Figures/*
  cp -r $srcdir/Figures "$pkgdir/usr/share/doc/$pkgname/Figures"
}

# vim:set ts=2 sw=2 et: