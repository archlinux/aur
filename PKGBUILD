# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-game-git
pkgver=v1.09.01.r0.g714af2e7
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine - Git version"
url="http://www.flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('flare-engine-git')
conflicts=('flare-game')
replaces=('flare-game')
source=("git+https://github.com/flareteam/flare-game")
sha1sums=('SKIP')

pkgver() {
    cd $srcdir/flare-game
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/flare-game

	msg "Running cmake..."
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	msg "Compiling..."
	make
}

package() {
	cd $srcdir/flare-game
	msg "Installing..."
	make install DESTDIR=$pkgdir
}
