# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Elrond46 <elrond94 lol com>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Dmitry Shilov <stormblast@land.ru>

pkgname=doomsday
pkgver=2.0.3
pkgrel=3
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('doomsday-bin')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'fluidsynth')
makedepends=('imagemagick' 'cmake')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware'
		    'soundfont-fluid')
source=("http://files.dengine.net/archive/doomsday-$pkgver.tar.gz")
sha256sums=('baf8b1b40150dd2e16d0badc6ee3e7094ea8e42075d6801e9586b19a4065ce7e')

build() {
        
    # Enter build directory
    cd $srcdir/$pkgname-$pkgver/$pkgname

    # Generate makefiles using qmake
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	         -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/$pkgname/build
    make install DESTDIR="$pkgdir" 

    # Look for WADs in /usr/share/games/doom by default
    mkdir -p "${pkgdir}/etc/doomsday"
    echo "iwaddir: /usr/share/games/doom" > "${pkgdir}/etc/doomsday/paths"
    # For Music
    echo "Do not forget to start fluidsynth service after adding your soundfonts to etc/conf.d/fluidsynth (SOUND_FONT line) if you want to use fluidsynth music output"
}


