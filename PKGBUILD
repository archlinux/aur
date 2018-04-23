# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=librevisa-git
pkgver=alpha.2013.08.12.r6.g0a5cb66
pkgrel=1
pkgdesc="Compliant implementation of the VISA standard in a free software library from git"
arch=('any')
url="http://www.librevisa.org/"
license=('GPL3')
depends=('avahi' 'libusb')
provides=('librevisa')
conflicts=('librevisa')

_gitroot='http://www.librevisa.org/git/librevisa.git'
_gitname='librevisa'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="${pkgdir}" install
}

