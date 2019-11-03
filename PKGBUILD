# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Elrond46 <elrond94 lol com>
# Contributor: Zohar Malamant <dotfloat gmail com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Dmitry Shilov <stormblast@land.ru>

pkgname=doomsday
pkgver=2.1.2
pkgrel=1
pkgdesc="An advanced Doom engine that supports DOOM, Heretic and Hexen."
url="http://dengine.net/"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('doomsday-bin' 'assimp')
provides=('assimp')
depends=('qt5-x11extras' 'sdl2_mixer' 'fluidsynth' 'openal' 'libxrandr' 'lib32-fluidsynth')
makedepends=('imagemagick' 'cmake')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware'
		    'soundfont-fluid')
source=("http://files.dengine.net/archive/doomsday-$pkgver.tar.gz")
sha256sums=('4362d12b616a035ef21cfd54c3a841900dc6d6614b3d073a50a646ef87ebdc9c')

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


