# Maintainer: dorkster <jajdorkster@gmail.com>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=flare-engine-git
pkgver=1.14.r0.g4955c896
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine - Git version"
url="https://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64 aarch64)
makedepends=(git cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
provides=(flare-engine)
conflicts=(flare-engine)
source=("git+https://github.com/flareteam/flare-engine")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/flare-engine"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/flare-engine"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
    make
}

package() {
    cd "$srcdir/flare-engine"
    make install DESTDIR="$pkgdir"
}
