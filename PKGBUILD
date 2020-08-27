# Maintainer: Henry Nelson <hcnelson99 at gmail dot com>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod-git
_pkgname="${pkgname%-git}"
pkgver=1.16.0.alpha.12.r0.g1c8be39
pkgrel=1
pkgdesc="Roguelike graphics/utility library. Development version."
arch=('i686' 'x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/$_pkgname/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
   cd "$srcdir/$_pkgname/buildsys/autotools"
   autoreconf -i
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/${_pkgname}/buildsys/autotools"
   make DESTDIR="$pkgdir" install
   
   mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
   cp "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
