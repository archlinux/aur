# Maintainer: David Runge <dave@sleepmap.de>
pkgname=veejay-server-git
_name=veejay-server
_pkgroot=veejay
pkgver=1.5.51.r35.gedd474e
pkgrel=2
pkgdesc="Veejay is a visual instrument and realtime video sampler for GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.veejayhq.net"
groups=('veejay')
conflicts=('veejay-server')
replaces=('veejay-server')
provides=('veejay-server')
license="LGPL"
depends=('libxml2' 'libx11' 'jack' 'ffmpeg' 'sdl' 'gtk2' 'libjpeg-turbo' 'ffmpeg')
makedepends=('git')
source=("${_name}::git+git://code.dyne.org/veejay.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}/${_pkgroot}-current"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$srcdir/${_name}/${_pkgroot}-current/${_name}"
  ./autogen.sh
  ./configure --prefix=/usr
  make 2>&1 | tee build.log
}

package() {
  cd "$srcdir/${_name}/${_pkgroot}-current/${_name}"
  make DESTDIR="$pkgdir" install
}
