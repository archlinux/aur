# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=garden
pkgver=1.0.9
pkgrel=1
pkgdesc="Garden of coloured lights, a game by Linley Henzell, is a vertical shoot-em-up that is a piece of art"
arch=('i686' 'x86_64')
url="http://garden.sourceforge.net"
license=('GPL3')
depends=('allegro4' 'hicolor-icon-theme')
provides=('garden')
source=(http://sourceforge.net/projects/garden/files/garden/${pkgver}/garden-${pkgver}.tar.gz)
md5sums=('b9cce86ab226164279ef325f9d798397')

prepare() {
    cd "${srcdir}/garden-${pkgver}"
    sed -i 's|inline int xpart (int angle, int length);|//&|' src/stuff.c
    sed -i 's|^inline int xpart (int|int xpart (int|' src/stuff.c
    sed -i 's|^inline int ypart (int|int ypart (int|' src/stuff.c
}

build() {
    cd "${srcdir}/garden-${pkgver}"
    LIBS="$LIBS -lm" ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/garden-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:

