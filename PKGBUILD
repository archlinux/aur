# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

_pkgname="srb2-legacy"
pkgname="${_pkgname}-git"
pkgver=2.1.26
_dataver=2.1.25
pkgrel=1
pkgdesc='Updated fork of Sonic Robo Blast 2 2.1.25'
arch=('i686' 'x86_64' 'aarch64')
license=('GPL')
url='https://github.com/P-AS/srb2-legacy'
depends=('sdl2' 'sdl2_mixer' 'curl' 'libpng' 'libgme' 'libopenmpt' "srb2-legacy-data>=$_dataver")
makedepends=('git' 'mesa' 'glu')
makedepends_i686=('nasm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/P-AS/srb2-legacy.git"
        "srb2legacy.desktop")
sha256sums=('SKIP'
            'aac94fbe41be3d118b58a175442fb27fd37ad7e2c525347cd01282be5d11a7e0')

build() {
  cd "$srcdir"/srb2-legacy/src

  [ "$CARCH" == "i686" ] && IS64BIT="" || IS64BIT="64"
  # (optional: be verbose)
  make LINUX$IS64BIT=1 #ECHO=1
}

package() {
  install -Dm755 "$_pkgname"/bin/lsdl2srb2legacy \
    "$pkgdir"/usr/bin/srb2legacy

  # icon + .desktop
  install -Dm644 "$_pkgname"/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2legacy.xpm
  install -Dm644 srb2legacy.desktop "$pkgdir"/usr/share/applications/srb2legacy.desktop
}
