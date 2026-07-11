# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

_pkgname="srb2"
pkgname="${_pkgname}-git"
pkgver=2.2.15.r688.geb16ca3
_dataver=2.2.15
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2") (git version)'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url='https://www.srb2.org'
depends=('sdl2' 'sdl2_mixer' 'curl' 'libpng' 'libgme' 'libopenmpt' 'miniupnpc' "srb2-data>=$_dataver")
makedepends=('git' 'mesa')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip !debug)
source=("git+https://github.com/STJr/SRB2.git#branch=next"
	"srb2.desktop")
sha256sums=('SKIP'
            '9f0b31f9d91f31077b55e70301ea1c07609a7eea44aeb5cf370a4ff78e0e5215')

pkgver() {
  cd SRB2
  git describe --long --tags --abbrev=7 | sed 's/^SRB2_release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/SRB2/src

  [ "$CARCH" == "i686" ] && IS64BIT="" || IS64BIT="64"
  # (optional: be verbose)
  make LINUX$IS64BIT=1 #ECHO=1
}

package() {
  install -Dm755 SRB2/bin/lsdl2srb2 \
    "$pkgdir"/usr/bin/srb2

  # icon + .desktop
  install -Dm644 SRB2/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
}
