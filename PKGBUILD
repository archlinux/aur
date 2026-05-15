# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=redex-git
_pkgname=redex
pkgver=r10012.570e5ca41
pkgrel=1
pkgdesc="A bytecode optimizer for Android apps"
arch=('i686' 'x86_64')
url="http://fbredex.com/"
license=('BSD')
depends=('python' 'boost-libs' 'jsoncpp' 'protobuf')
makedepends=('git' 'boost' 'kotlin')
provides=('redex')
conflicts=('redex')
source=("git+https://github.com/facebook/${_pkgname}/")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  sed -i 's/ANDROID_SDK/ANDROID_HOME/g' redex.py
}

build() {
  cd "${_pkgname}"

  autoreconf -ivf
  ./configure --prefix=/usr --enable-protobuf
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir/" install
}
