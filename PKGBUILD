# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod-hg
pkgver=r291.4f2954a3b05c
pkgrel=1
pkgdesc="Roguelike graphics/utility library. Development version."
arch=('i686' 'x86_64')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('libpng' 'sdl' 'glu')
makedepends=('mercurial')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
options=(!makeflags)
source=("hg+https://bitbucket.org/${pkgname%-hg}/${pkgname%-hg}")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/${pkgname%-hg}" 
   printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
   cd "$srcdir/${pkgname%-hg}" 

   make -f build/makefile-linux clean release TEMP=$srcdir/tmp
}

package() {
   mkdir -p $pkgdir/usr/lib
   mkdir -p $pkgdir/usr/include/$pkgname

   cd "$srcdir/${pkgname%-hg}" 
   
   install -D -m 644 libtcod{,gui,xx}.so $pkgdir/usr/lib/
   install -D -m 644 include/*.h* $pkgdir/usr/include/$pkgname/
}

# vim:set ts=2 sw=2 et:
