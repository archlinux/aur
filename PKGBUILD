# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: Drew Liszewski <drew dot liszewski at gmail dot com>
# Contributor: Daniel Varga <varga dot daniel at gmx dot de>

pkgname=emulationstation-git
_gitname=EmulationStation
pkgrel=1
epoch=1
pkgver=2.4.1.r392.gb7bec0eb
pkgdesc="A graphical front-end for emulators with controller navigation. Developed for the Raspbery Pi, but runs on most Linux systems."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/RetroPie/EmulationStation"
license=('MIT')
makedepends=('git' 'boost' 'freetype2' 'eigen' 'cmake' 'mesa' 'libsm' 'rapidjson')
depends=('alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'ttf-dejavu' 'glu' 'vlc' 'libcec')
if [ "$CARCH" = "armv6h" ]; then
depends+=('raspberrypi-firmware')
else
depends+=('libgl')
fi
source=('git://github.com/RetroPie/EmulationStation.git')
md5sums=('SKIP')
provides=('emulationstation')

pkgver() {
  cd $srcdir/$_gitname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitname"
	git submodule update --init
}

build() {
    cd "$srcdir/$_gitname"
    mkdir -p "$srcdir/$_gitname/build"
    cd "$srcdir/$_gitname/build"
    cmake ..
    make
}

package() {
    cd $_gitname
    install -Dm755 "$srcdir/$_gitname/emulationstation" "$pkgdir/usr/bin/emulationstation"
    install -Dm644 "$srcdir/$_gitname/LICENSE.md" "$pkgdir/usr/share/licenses/emulationstation-git/LICENSE"
}
