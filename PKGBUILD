# Maintainer: Winston Weinert <winston@ml1.net>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

_pkgname=libtcod
pkgname=$_pkgname-151
pkgver=1.5.1
pkgrel=2
pkgdesc="Roguelike graphics/utility library (v1.5.1 maintained for brogue)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('libpng' 'sdl' 'glu')
makedepends=('mercurial')
options=(!makeflags)
source=("hg+https://bitbucket.org/$_pkgname/$_pkgname#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  patch -Np1 -i $startdir/libtcod-151.patch

  if test "$CARCH" == x86_64; then
      make -f makefiles/makefile-linux64 clean release TEMP=$srcdir/tmp
  else
    make -f makefiles/makefile-linux clean release TEMP=$srcdir/tmp
  fi
}

package() {
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include/$_pkgname-$pkgver

  cd "$srcdir/$_pkgname"

  for i in libtcod{,gui,xx}.so.${pkgver}; do
    install -D -m 755 $i $pkgdir/usr/lib/$i
  done
  install -D -m 644 include/*.h* $pkgdir/usr/include/$_pkgname-$pkgver/
}

# vim:set ts=2 sw=2 et:
