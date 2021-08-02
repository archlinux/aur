# Maintainer: dorkster <jajdorkster@gmail.com>
# Maintainer: Fabio Loli <lolix@disroot.org>

pkgname=flare-game-git
pkgver=1.12
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine - Git version"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa-3.0')
arch=(i686 x86_64)
makedepends=(git cmake)
depends=(flare-engine-git)
provides=(flare-game)
conflicts=(flare-game)
source=("git+https://github.com/flareteam/flare-game")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/flare-game"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/flare-game"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
    make
}

package() {
    cd "$srcdir/flare-game"
    make install DESTDIR="$pkgdir"
}
