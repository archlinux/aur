# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=redex-git
_pkgname=redex
pkgver=r58.3b12645
pkgrel=1
pkgdesc="A bytecode optimizer for Android apps"
arch=('i686' 'x86_64')
url="http://fbredex.com/"
license=('BSD')
depends=('python' 'boost-libs' 'double-conversion' 'gflags' 'google-glog' 'libevent' 'lz4' 'xz' 'snappy' 'jemalloc' 'folly-git')
makedepends=('git' 'boost')
provides=('redex')
conflicts=('redex')
source=("git+https://github.com/facebook/${_pkgname}/"
        "${_pkgname}.patch")
sha256sums=('SKIP'
            '62e48fd8c554cfaaf21eadca6d74617f559780f1fd0fa9d61b5201fce961d6bb')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  patch -i "$srcdir/${_pkgname}.patch"
}

build() {
  cd "${_pkgname}"

  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

