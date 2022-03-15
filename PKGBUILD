# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=mm-common
pkgname=${_base}-git
pkgver=0.9.12.r7.gcca2cf9
pkgrel=1
pkgdesc="The build infrastructure and utilities shared among the GNOME C++ binding libraries"
arch=(any)
url="https://github.com/GNOME/${_base}"
license=(GPL)
depends=(bash)
makedepends=(git wget)
provides=(${_base})
conflicts=(${_base})
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --always | sed 's|-|.r|' | tr - .
}

build() {
  cd ${_base}
  ./autogen.sh
  ./configure --prefix=/usr --enable-network
  make
}

package() {
  cd ${_base}
  make DESTDIR="$pkgdir/" install
}
