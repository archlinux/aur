# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=chocolate-doom-git
pkgdesc="Historically-accurate Doom, Heretic, Hexen, and Strife ports."
pkgver=3.0.0.r822.ee9fc21f
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.chocolate-doom.org/"
license=('GPL2')
install=chocolate-doom.install
depends=('libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('git' 'python')
optdepends=('freedm: Free deathmatch game'
            'freedoom1: Free Ultimate Doom-compatible game'
            'freedoom2: Free Doom II/Final Doom-compatible game')
conflicts=(chocolate-common
          chocolate-doom
          chocolate-heretic
          chocolate-hexen
          chocolate-strife)
replaces=(chocolate-common-git
          chocolate-heretic-git
          chocolate-hexen-git
          chocolate-strife-git)
source=(git+https://github.com/chocolate-doom/chocolate-doom.git)
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname/-git//}"
  local version="$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
  printf %s "${version##chocolate.doom.}"
}

build() {
  cd "${pkgname/-git//}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${pkgname/-git//}"

  make DESTDIR="${pkgdir}" install
}
