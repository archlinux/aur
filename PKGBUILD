# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod
pkgver=1.5.1
pkgrel=5
pkgdesc="Roguelike graphics/utility library"
arch=('i686' 'x86_64')
url="http://roguecentral.org/doryen/libtcod/"
license=('BSD')
depends=('libpng' 'sdl' 'glu')
options=(!makeflags)
source=(http://roguecentral.org/doryen/?file_id=26
        makefile-linux64.patch)
md5sums=('3efe844f03fa4d6fdff98aa4cc85ef3d'
         'af563a240f9a101c105d3abb25a1f19e')

build() {
   cd "$srcdir/$pkgname-$pkgver"

   if test "$CARCH" == x86_64; then
      patch -p0 < $srcdir/makefile-linux64.patch
      make -f makefiles/makefile-linux64 clean release TEMP=$srcdir/tmp
   else
      make -f makefiles/makefile-linux clean release TEMP=$srcdir/tmp
   fi
}

package() {
   mkdir -p $pkgdir/usr/lib
   mkdir -p $pkgdir/usr/include/$pkgname

   cd "$srcdir/$pkgname-$pkgver"
   
   install -D -m 644 libtcod{,gui,xx}.so $pkgdir/usr/lib/
   install -D -m 644 include/*.h* $pkgdir/usr/include/$pkgname/
}

# vim:set ts=2 sw=2 et:
