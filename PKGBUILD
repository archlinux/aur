# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=russian-doom-git
pkgver=6.3~117
pkgrel=1
pkgdesc="A limit-removing source port of Doom, Heretic and Hexen with enhancements and Russian translation (git version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Russian-Doom/russian-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('doom1-wad: Doom shareware game data' 'heretic1-wad: Heretic shareware game data' 'hexen1-wad: Hexen demo game data')
conflicts=('russian-doom')
source=("git+https://github.com/Russian-Doom/russian-doom.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/russian-doom"
    ver=$(cmake -P ./cmake/scripts/UpdateRevision.cmake "git" 2>&1)
    echo "${ver//-/_}"
}

build() {
    cd russian-doom
    cmake --workflow --preset "arch-linux-release"
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/russian-doom"
    mv "${pkgdir}/usr/share/doc/russian-doom/GPL.txt" "${pkgdir}/usr/share/licenses/russian-doom/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
