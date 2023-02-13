# Maintainer: loooph <loooph@gmx.de>
pkgname=fairtris-git
_basename=Fairtris
pkgver=3.0.0.2.beta.r23.g13f5c4f
pkgrel=1
pkgdesc="PC clone of the official classic Nintendo Tetris® game for the NES console, Linux fork"
url="https://github.com/chronoscz/Fairtris"
license=('Unlicense')
arch=(any)
depends=(sdl2 sdl2_image sdl2_mixer)
makedepends=(lazarus git)
provides=(fairtris)
conflicts=(fairtris)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    git describe --tags | sed 's/v\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir/$_basename/source"
    lazbuild --lazarusdir=/usr/lib/lazarus --build-mode=Release Fairtris.Main.lpi
}

package() {
    cd "$srcdir/$_basename"
    install -Dt "$pkgdir/usr/bin" bin/fairtris
    install -d "$pkgdir/usr/share/fairtris"
    cp -r bin/grounds "$pkgdir/usr/share/fairtris"
    cp -r bin/sprites "$pkgdir/usr/share/fairtris"
    cp -r bin/sounds "$pkgdir/usr/share/fairtris"
    install -Dt "$pkgdir/usr/share/applications" install/snap/local/fairtris.desktop
    install -d "$pkgdir/usr/share/pixmaps/"
    install graphics/application/64.png "$pkgdir/usr/share/pixmaps/fairtris.png"
}
