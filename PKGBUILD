# Maintainer: Milk Brewster (milk on freenode)

_pkgname=midimonster
pkgname=${_pkgname}-git
pkgver=v0.1.r1.ga0831a2
pkgrel=1
pkgdesc="Multi-protocol translation software (ArtNet, MIDI, OSC, JACK MIDI/CV ...)"
arch=('x86_64' 'i686')
url="https://github.com/cbdevnet/midimonster"
license=('BSD')
depends=('pkg-config' 'gcc' 'make' 'alsa-lib' 'libevdev' 'lua' 'jack')
makedepends=()
provides=()
conflicts=()
source=("git+https://github.com/cbdevnet/midimonster")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  export PREFIX=/usr
  export PLUGINS=$PREFIX/lib/midimonster
  # export DEFAULT_CFG=/etc/midimonster.cfg
  make clean
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
