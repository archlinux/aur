# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Beej Jorgensen <beej@beej.us>
# Maintainer: Thomas Laroche <tho.laroche@gmail.com>
pkgname=fann-git
pkgver=2.2.0.r57.g0e6fa25
pkgrel=1
pkgdesc="Fast artificial neural network library"
url="http://leenissen.dk/fann/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
makedepends=('cmake')
source=("$pkgname::git+https://github.com/libfann/fann.git")
md5sums=('SKIP')
conflicts=('fann')
provides=('fann')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}
