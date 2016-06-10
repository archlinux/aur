# Maintainer:  VirtualTam <virtualtam@flibidi.net>
pkgname=midijoystick-git
pkgver=a98d0d6
pkgrel=1
pkgdesc="JACK client to map joystick buttons to MIDI events"
arch=('i686' 'x86_64')
url="https://github.com/osune/MidiJoystick"
license=('MIT')
depends=('gambit-c' 'jack')
makedepends=('git')
provides=('midijoystick')
_gitname="MidiJoystick"
source=(git://github.com/osune/${_gitname}.git)
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  git describe --long --always --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  make
}

package() {
  cd ${_gitname}
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "midijoystick" "${pkgdir}/usr/bin/midijoystick"
}
