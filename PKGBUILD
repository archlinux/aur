# Maintainer: Konstantin Gizdov arch at kge dot pw

_pkgname=libsocketcan
pkgname="${_pkgname}-git"
pkgver=r101.b464485
pkgrel=1
source=("${_pkgname}::git+https://github.com/lalten/libsocketcan#branch=gh-pages")
sha256sums=('SKIP')
arch=('x86_64')
makedepends=('git')
pkgdesc='allows control of some basic functions in SocketCAN from userspace'
license=('LGPL2.1')
url='http://lalten.github.io/libsocketcan/'
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  # fix missing build rule
  cp README.md README
  make
}

package () {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
