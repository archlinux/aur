# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
# Contributor: Xyne <ac xunilhcra enyx, backwards>
pkgname=gladtex
pkgver=1.4.2
pkgrel=1
pkgdesc="A utility for writing LaTeX equations within HTML"
depends=('perl' 'ghostscript' 'texlive-bin' 'libpng' 'giflib')
#optdepends=('giflib')
arch=('i686' 'x86_64')
license=('GPL')
url="http://ans.hsh.no/home/mgg/gladtex/"
source=(
  "http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz"
  Makefile
  gladtex-1.4.2-giflib5.diff
)
md5sums=('c812911a81f97daf817f700f6facd004'
         'b6bab5fd266349ab4718c73561944c53'
         '8411b82677eeb6a47750ee2d5561d17f')
sha256sums=('fa0eb40d1f6ae6b923bd596c67771bab9ab4452e952be25e122f62d2e9840429'
            'c23c289fc62ab430d2de351096307f3e128f417781b65179beb1fbfd2adf1f2a'
            'db8b5ae596f8ef68ab35455d44e52f9c8b8a2bd293914891e6b95b41bb25306a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cp "$srcdir/Makefile" .
  patch -p0 < "$srcdir/gladtex-1.4.2-giflib5.diff"
#  sed -i -e 's/defined %history/%history/' gladtex
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's!/usr/local!'"$pkgdir"'/usr!' Makefile
  make install
  ln -s gladtex.1 "$pkgdir"/usr/share/man/man1/eqn2img.1
}
# vim: set ts=2 sw=2 et:
