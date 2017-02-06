# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless

pkgname=libtcod-hg
pkgver=r423.f164d6bb25a4
pkgrel=1
pkgdesc="Roguelike graphics/utility library. Development version."
arch=('i686' 'x86_64')
url="https://bitbucket.org/libtcod/libtcod"
license=('BSD')
depends=('sdl2')
makedepends=('mercurial')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
source=("hg+https://bitbucket.org/${pkgname%-hg}/${pkgname%-hg}")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/${pkgname%-hg}" 
   printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
   cd "$srcdir/${pkgname%-hg}/build/autotools"
   autoreconf -i
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/${pkgname%-hg}/build/autotools"
   make DESTDIR="$pkgdir" install
   
   mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
   cp "$srcdir/${pkgname%-hg}/LIBTCOD-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
