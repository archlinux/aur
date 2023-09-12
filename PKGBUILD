# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mpg123-svn
pkgver=r5325
pkgrel=1
pkgdesc="A fast and free real time MPEG Audio Layer 1, 2 and 3 decoding library and console player"
arch=('i686' 'x86_64')
url="https://www.mpg123.org/"
license=('LGPL')
depends=('glibc' 'alsa-lib')
makedepends=('subversion' 'sdl' 'jack' 'libpulse')
provides=("mpg123=$pkgver")
conflicts=('mpg123')
source=("svn://scm.orgis.org/mpg123/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _rev="$(svnversion | sed 's/[^0-9]+//')"
  printf "r%s" "$_rev"
}

build() {
  cd "trunk"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --enable-int-quality=yes \
    --with-audio="alsa oss sdl jack pulse"
  make
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install
}
