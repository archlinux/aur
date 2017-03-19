# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=aseqjoy-git
pkgver=0.0.2
pkgrel=1
pkgdesc="Joystick to ALSA MIDI Sequencer Converter"
arch=('i686' 'x86_64')
url="https://terminatorx.org/addons/"
license=('GPL2')
groups=('alsa' 'midi' 'usb')
depends=('alsa-lib')
makedepends=('autoconf')
provides=('aseqjoy')
source=(git+https://terminatorX.org/src/aseqjoy.git)
_gitname='aseqjoy'
noextract=()
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --tags --always | sed 's/v//'
}

build() {
  cd ${_gitname}
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd ${_gitname}
  make check
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}
