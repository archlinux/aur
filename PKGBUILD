# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=allegro-blasteroids-git
pkgver=v1.1.r1.g1cc91b3
depends=('allegro')
makedepends=('cmake')
pkgrel=1
pkgver=v1.1.r1.g1cc91b3
arch=(x86_64)
pkgdesc="A game inspired on blasteroids started from the last proposed exercise of Head First C"
license=("custom")
options=(!strip)
url="https://github.com/lucasew/allegro_blasteroids"
source=("git+https://github.com/lucasew/allegro_blasteroids/")

sha256sums=("SKIP")

pkgver() {
  cd "allegro_blasteroids"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    ORIGIN=$srcdir/allegro_blasteroids
    DESTINATION=$pkgdir/opt/allegro-blasteroids
    mkdir -p $DESTINATION
    mkdir -p $pkgdir/usr/share/applications
    cmake $ORIGIN
    echo "Disabling verbose code..."
    cp ../config.h $ORIGIN/include/blasteroids
    make
    cp blasteroids $DESTINATION
    cp blasteroids_font.ttf $DESTINATION
    cp ../AllegroBlasteroids.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/bin
    cp ../ablasteroids $pkgdir/usr/bin
}
