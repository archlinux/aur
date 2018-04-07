# Maintainer: goetzc
# Contributor: Jonathan Squirawski <sky@sky-co.de>
pkgname=libeatmydata
pkgver=105.r15.g1e5ae05
pkgrel=2
pkgdesc='Library and utilities designed to disable fsync and friends.'
arch=('i686' 'x86_64')
url='https://github.com/stewartsmith/libeatmydata'
license=('GPL3')
conflicts=('eatmydata')
_commit=1e5ae05a3a03c1a94fa16ed9563a45d3e97062d1
source=("git+https://github.com/stewartsmith/${pkgname}/#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd libeatmydata
  git describe --tags | sed 's/^libeatmydata-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libeatmydata
  autoreconf -i
  ./configure --prefix=/usr --libexecdir=/usr/lib/libeatmydata
  make
}

check() {
  cd libeatmydata
  make check
}

package() {
  cd libeatmydata
  make DESTDIR="${pkgdir}" install
  libtool --finish /usr/lib
}
