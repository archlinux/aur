# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=nickle-git
pkgver=20101024
pkgrel=1
pkgdesc="A C-like language with the functionality of bc/dc/expr in much-improved form."
url="http://nickle.org/"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
conflicts=('nickle')
provides=('nickle')
source=('git://keithp.com/git/nickle')
md5sums=('SKIP')

_gitname='nickle'

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  rm -f configure
  autoreconf -Wall -v --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}

