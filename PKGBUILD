# Maintainer: Ken Mitton <mittonk at alum dot mit dot edu>

pkgname=dice-emu
pkgver=0.9
pkgrel=1
pkgdesc='Discrete Integrated Circuit Emulator (DICE) for TTL-based arcade games like Pong.'
arch=('x86_64')
url='https://adamulation.blogspot.com/'
license=('GPL-3.0-or-later')
depends=('qt4' 'sdl' 'glu')
# Note this requires real SDL 1.2 and won't work with sdl12-compat, failure mode is:
# =====
# $ dice
# Unable to set video mode:
# The specified window isn't an OpenGL window
# =====
conflicts=('sdl12-compat')
makedepends=()
source=("${pkgname}-${pkgver}.zip::http://sourceforge.net/projects/dice/files/DICE/DICE%200.9/dice.0.9.src.zip/download")
sha256sums=('3f89640cce1dc21d9e632b914fcf089a82efa868bad487b634ac9a76fc81257b')

prepare() {
    # Explicitly use the qt4 version of moc.
    sed -i "s|moc -i|moc-qt4 -i|" Makefile
}

build() {
    make
}

package() {
    install -Dm755 dice ${pkgdir}/usr/bin/dice
}
