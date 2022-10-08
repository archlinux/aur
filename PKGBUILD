# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=qmidiplayer-git
pkgver=r237.07ee50b
pkgrel=1
pkgdesc='A cross-platform midi file player based on libfluidsynth and Qt.'
arch=('x86_64')
url='https://chrisoft.org/QMidiPlayer/'
license=('GPLv3')
conflicts=('qmidiplayer')
depends=(
    'qt5-base' 'qt5-quickcontrols'
    'rtmidi' 'fluidsynth'
    'freetype2' 'zlib' 'libjpeg-turbo' 'libpng'
    'glfw' 'glew' 'openal' 'devil'
)
makedepends=(
    'git'
    'cmake'
)
source=(
    'git+https://git.chrisoft.org/git/QMidiPlayer.git'
    'git+https://git.chrisoft.org/git/SMELT.git'
)
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd ${srcdir}/QMidiPlayer

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/QMidiPlayer
    git submodule init
    git config submodule.SMELT.url ${srcdir}/SMELT
    git submodule update
}

build () {
    cd ${srcdir}/QMidiPlayer
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    cmake --build . -j
}

package() {
    make -C ${srcdir}/QMidiPlayer DESTDIR="$pkgdir" install
}
