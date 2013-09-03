# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=freeciv-svn
pkgver=23273
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization"
url="http://www.freeciv.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl' 'gtk2' 'imagemagick' 'sdl_mixer' 'hicolor-icon-theme')
makedepends=('subversion')
conflicts=('freeciv')
provides=('freeciv')
options=('!libtool')
source=('freeciv::svn+http://svn.gna.org/svn/freeciv/trunk')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/freeciv
    svnversion | tr -d [A-z]
}

build() {
    cd ${srcdir}/freeciv

    ./autogen.sh
    ./configure --prefix=/usr --enable-client=gtk2 --enable-shared --without-ggz-client
    make
}

package() {
    cd ${srcdir}/freeciv

    make DESTDIR=${pkgdir} install
}
