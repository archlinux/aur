# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=libadlmidi-git
_pkgname=libADLMIDI
pkgver=1.3.1.r19.g1705a4c
pkgrel=1
epoch=
pkgdesc="A MIDI play library with OPL3 (YMF262) emulator"
arch=('x86_64')
url="https://github.com/Wohlstand/libADLMIDI"
license=('LGPL3')
groups=()
depends=('sdl2')
makedepends=()
checkdepends=()
optdepends=()
provides=('libadlmidi')
conflicts=('libadlmidi')
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=("git+https://github.com/Wohlstand/libADLMIDI.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DlibADLMIDI_STATIC=ON \
        -DlibADLMIDI_SHARED=OFF \
        -DWITH_MIDIPLAY=ON \
        -DWITH_EMBEDDED_BANKS=ON \
        -DWITH_CPP_EXTRAS=ON \
        ..
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}
