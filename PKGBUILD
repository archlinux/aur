# Maintainer: francokiwi <francokiwi at protonmail dot com>
# Contributor: francokiwi <francokiwi at protonmail dot com>

pkgname=moe-mansion
pkgver=1.3
_dataver=1.3
pkgrel=1
pkgdesc='A rolling release/nightly version of srb2kart 1.3 based on birdhouse with a couple other changes.'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://mb.srb2.org/showthread.php?t=49381'
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2kart-data>=$_dataver")
makedepends=('mesa' 'glu' 'git')
makedepends_i686=('nasm')
options=(!buildflags) 
source=("git+https://gitlab.com/himie/kart-public.git"
        "srb2kart.desktop"
        "srb2kart-opengl.desktop")
sha256sums=('SKIP'
            'e99f64fdbe8f2db5cbda55415ab238daf3aa50d10fad089c6de6e3b815d9392e'
            '03bf7a10d6d2d5f0fd8ccefdf82a59b2ff1274a3913faf12cd21424f0e7a4bad')

build() {
  cd "$srcdir"/kart-public/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # Don't compress with UPX
  make NOUPX=1 LINUX$IS64BIT=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  sudo install -Dm755 "$srcdir"/kart-public/bin/Linux$IS64BIT/Release/lsdl2srb2kart /usr/bin/moe-mansion
  # icon + .desktop
  sudo install -Dm644 "$srcdir"/kart-public/src/sdl/SDL_icon.xpm /usr/share/pixmaps/srb2kart.xpm
  sudo install -Dm644 srb2kart.desktop /usr/share/applications/srb2kart.desktop
  sudo install -m644 srb2kart-opengl.desktop /usr/share/applications
}
