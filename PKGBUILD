# Contributor: sickhate <sickhate@tux-linux.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=simdock-git
pkgver=72.20fec28
pkgrel=1
pkgdesc="Fast and customizable dockbar."
arch=('i686' 'x86_64')
url="https://github.com/onli/simdock"
license=('GPL')
depends=('wxgtk2.8' 'libwnck' 'gconf')
provides=('simdock')
conflicts=('simdock')
install=simdock.install
source=("git://github.com/onli/simdock.git")
_repo=simdock
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_repo}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_repo}"
  sed -i 's+wx-config+wx-config-2.8+' Makefile
}

build() {
  cd "$srcdir/${_repo}"
  make 
}

package() {
  cd "$srcdir/${_repo}"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/local
}
