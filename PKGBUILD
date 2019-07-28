# Maintainer: Michael Taboada <michael@2mb.solutions>
# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: Alexandre Moine < nobrakal at cthugha dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Kyle < kyle at free 2 dot ml >

pkgname=tuxtype-git
_gitname=tuxtype
pkgver=r515.b495eb9



pkgrel=1
pkgdesc="An educational typing tutorial game starring Tux"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/"
license=('GPL')
#depends=('audiofile' 'esound' 'libjpeg' 'libpng' 'libvorbis' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_pango' 't4kcommon-git')
depends=('t4kcommon-git')
#depends=('sdl_image' 'sdl_mixer' 'sdl_pango' 'sdl_net' 'libpng' 'librsvg' 'libxml2')
makedepends=('autoconf' 'automake' 'gettext' 'libtool' 'make' 'git')
options=('!docs')
#replace=('t4k_common')
provides=('tuxtype')
conflicts=('tuxtype')
source=("git+https://github.com/tux4kids/tuxtype")
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "$srcdir/$_gitname"
#  patch -Np2 -i "$srcdir/libpng15.patch"
#}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -if .
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR=$pkgdir install
}

