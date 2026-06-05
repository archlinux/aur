# Maintainer: xdf22 <nothingjust752 at gmail dot com>

_pkgname="srb2-retro"
pkgname="${_pkgname}-git"
pkgver=aef0d7e
_dataver=2.0.6
pkgrel=1
pkgdesc='Updated fork of Sonic Robo Blast 2 2.0.7 (git version)'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url='https://github.com/srb2-preservation/srb2-retro'
depends=('sdl2' 'sdl2_mixer' 'curl' 'libpng' 'zlib' "srb2-retro-data>=$_dataver")
makedepends=('git' 'mesa')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/srb2-preservation/srb2-retro.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --always --abbrev=7
}

build() {
  cd "$srcdir"/srb2-retro/src

  [ "$CARCH" == "i686" ] && IS64BIT="" || IS64BIT="64"
  # (optional: be verbose)
  touch comptime.h

  make LINUX$IS64BIT=1 #ECHO=1
}

package() {
  install -Dm755 "$_pkgname"/bin/lsdl2srb2retro \
    "$pkgdir"/usr/bin/srb2retro

  # icon + .desktop
  install -Dm644 "$srcdir"/../srb2.png \
    "$pkgdir"/usr/share/icons/hicolor/256x256/apps/srb2retro.png
  install -Dm644 "$srcdir"/../srb2retro.desktop "$pkgdir"/usr/share/applications/srb2retro.desktop
}
