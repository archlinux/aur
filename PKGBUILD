# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod
pkgver=1.5.1
pkgrel=6
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('libpng' 'sdl' 'glu')
makedepends=('mercurial')
options=(!makeflags)
source=("hg+https://bitbucket.org/$pkgname/$pkgname#tag=$pkgver")
md5sums=('SKIP')

build() {
   cd "$srcdir/$pkgname"

   if test "$CARCH" == x86_64; then
      make -f makefiles/makefile-linux64 clean release TEMP=$srcdir/tmp
   else
      make -f makefiles/makefile-linux clean release TEMP=$srcdir/tmp
   fi
}

package() {
   mkdir -p $pkgdir/usr/lib
   mkdir -p $pkgdir/usr/include/$pkgname

   cd "$srcdir/$pkgname"
   
   install -D -m 644 libtcod{,gui,xx}.so $pkgdir/usr/lib/
   install -D -m 644 include/*.h* $pkgdir/usr/include/$pkgname/
}

# vim:set ts=2 sw=2 et:
