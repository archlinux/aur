# Maintainer: David Runge <dave@sleepmap.de>
pkgname=veejay-client-git
_pkg=veejay-client
_pkgroot=veejay
pkgver=1.5.57.r984.g560172d7
pkgrel=4
pkgdesc="A visual instrument and realtime video sampler for GNU/Linux (client)"
arch=('i686' 'x86_64')
url="https://github.com/c0ntrol/${_pkgroot}"
groups=('veejay')
conflicts=('veejay-client')
provides=('veejay-client')
license=('LGPL')
depends=('veejay-server')
makedepends=('git')
source=("${_pkg}::git+https://github.com/c0ntrol/${_pkgroot}")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkg}/${_pkgroot}-current"
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
