# Maintainer: David Runge <dave@sleepmap.de>
pkgname=veejay-server-git
_pkg=veejay-server
_pkgroot=veejay
pkgver=1.5.57.r984.g560172d7
pkgrel=3
pkgdesc="A visual instrument and realtime video sampler for GNU/Linux (server)"
arch=('i686' 'x86_64')
url="https://github.com/c0ntrol/${_pkgroot}"
groups=('veejay')
conflicts=('veejay-server')
provides=('veejay-server')
license=('LGPL')
depends=('libxml2' 'libx11' 'jack' 'ffmpeg' 'sdl' 'gtk2' 'libjpeg-turbo')
makedepends=('git')
source=("${_pkg}::git+https://github.com/c0ntrol/${_pkgroot}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkg}/${_pkgroot}-current"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "${_pkg}/${_pkgroot}-current/${_pkg}"
  autoreconf -fi
}

build() {
  cd "${_pkg}/${_pkgroot}-current/${_pkg}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkg}/${_pkgroot}-current/${_pkg}"
  make DESTDIR="${pkgdir}" install
}
