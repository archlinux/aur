# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname="PianoBooster"
pkgdesc='A MIDI file player that teaches you how to play the piano'
origname='PianoBooster'
pkgname='pianobooster-git'
pkgver=v0.7.2.r0.g9504171
pkgrel=1
makedepends=('cmake' 'qt5-tools')
depends=('ttf-dejavu' 'unzip' 'hicolor-icon-theme' 'alsa-lib' 'freetype2' 'ftgl' 'mesa' 'glu' 'qt5-base' 'jack' 'libffado' 'fluidsynth' 'soundfont-fluid' 'libnotify' 'rtmidi')
optdepends=('qt5-translations')
conflicts=('pianobooster')
replaces=('pianobooster')
arch=('x86_64')
url="https://github.com/captnfab/PianoBooster"
license=('GPL3+')
source=("git+https://github.com/captnfab/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build () {
    cd "${srcdir}/${_pkgname}"
    cmake -DUSE_SYSTEM_FONT=ON \
          -DWITH_MAN=ON \
          -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
    make
}

package () {
    cd "${srcdir}/${_pkgname}"
    make install -C build
}
