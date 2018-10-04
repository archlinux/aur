# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=libopnmidi-git
_pkgname=libOPNMIDI
pkgver=v1.4.0.r5.gc8c4803
pkgrel=1
epoch=
pkgdesc="A MIDI play library with OPN2 (YM2612) emulator"
arch=('x86_64')
url="https://github.com/Wohlstand/libOPNMIDI"
license=('LGPL3')
groups=()
depends=('sdl2')
makedepends=()
checkdepends=()
optdepends=()
provides=('libopnmidi')
conflicts=('libopnmidi')
replaces=()
backup=()
options=('staticlibs')
install=
changelog=
source=("git+https://github.com/Wohlstand/libOPNMIDI.git")
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
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DlibOPNMIDI_STATIC=ON \
        -DlibOPNMIDI_SHARED=ON \
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
