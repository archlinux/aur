# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname='PianoBooster'
pkgname='pianobooster-git'
pkgdesc='A MIDI file player that teaches you how to play the piano'
pkgver=v1.0.0.r20.gaaafb07
pkgrel=1
depends=('fluidsynth' 'ftgl' 'hicolor-icon-theme' 'qt5-base' 'rtmidi')
makedepends=('git' 'cmake' 'qt5-tools')
optdepends=('qt5-translations')
conflicts=('pianobooster')
replaces=('pianobooster')
arch=('x86_64')
url='https://www.pianobooster.org'
license=('GPL3+')
source=("git+https://github.com/pianobooster/PianoBooster")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_SYSTEM_FONT=ON \
          -DUSE_JACK=ON \
          -DWITH_MAN=ON .
    make
}

package () {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
