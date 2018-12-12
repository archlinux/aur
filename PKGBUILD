# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine-git
pkgver=v1.09.01.r0.g963cf203
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine - Git version"
url="http://www.flarerpg.org/"
license=('GPL3' 'CC-BY-SA-3.0')
arch=('i686' 'x86_64')
makedepends=('git>=1.7.10-1' 'cmake')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'hicolor-icon-theme' 'python')
conflicts=('flare-engine')
replaces=('flare-engine')
install="flare-engine-git.install"
source=("git+https://github.com/flareteam/flare-engine" 'flare-engine-git.install')
sha1sums=('SKIP' 'f1399479b57f5948fb07b188c7599c1f04d2989b')

pkgver() {
    cd $srcdir/flare-engine
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/flare-engine

	msg "Running cmake..."
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	msg "Compiling..."
	make
}

package() {
	cd $srcdir/flare-engine
	msg "Installing..."
	make install DESTDIR=$pkgdir
}
