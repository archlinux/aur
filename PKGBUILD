# Maintainer: Jonathon Fernyhough <jonathon_at manjaro_dot org>
# Contributor: John Trengrove
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=tcc-git
pkgver=0.9.27.r210.gf420259
pkgrel=1
pkgdesc='Tiny C Compiler'
arch=('x86_64' 'i686')
url='https://bellard.org/tcc/'
license=('LGPL2.1')
makedepends=('texi2html' 'git')
provides=('tcc')
conflicts=('tcc')
options=('staticlibs')
source=('git+https://repo.or.cz/tinycc.git')
md5sums=('SKIP')

pkgver() {
  cd tinycc
  git describe --tags --long | sed 's/^release_//; s/_/./g; s/-/.r/; s/-/./'
}

build() {
  cd tinycc
  ./configure --prefix=/usr
  make
}

check() {
  cd tinycc
  make -j1 test
}

package() {
  make -C tinycc DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
