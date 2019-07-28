# Maintainer: Michael Taboada <michael@2mb.solutions>
# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: Alexandre Moine < nobrakal at cthugha dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Kyle < kyle at free 2 dot ml >

pkgname=t4kcommon-git
_gitname=t4k-common-arch
pkgver=r4.013d039


pkgrel=4
pkgdesc="Common library for code shared by TuxType and TuxMath"
arch=('armv7h' 'aarch64' 'aarch64' 'i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_pango' 'sdl_net' 'libpng' 'librsvg' 'libxml2' 'espeak' 'libspeechd')
makedepends=('autoconf' 'automake' 'gettext' 'libtool' 'make' 'git')
options=('!docs')
provides=('t4kcommon')
conflicts=('t4kcommon')
source=("git+https://gitlab.com/stormdragon2976/t4k-common-arch")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
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
