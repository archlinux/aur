# Contributor: Alexander R. <sbir@list.ru>
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=tcc-git
pkgver=20121116
pkgrel=1
pkgdesc='Tiny C Compiler'
arch=('x86_64' 'i686')
url='http://bellard.org/tcc/'
license=('LGPLv2')
makedepends=('texi2html' 'git')
provides=('tcc')
conflicts=('tcc')
options=('staticlibs')
source=('git://repo.or.cz/tinycc.git')
md5sums=('SKIP')

prepare() {
  sed -i 's:-monolithic -number:-monolithic:' tinycc/Makefile
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tinycc

  ./configure --prefix=/usr
  make
}

package() {
  make -C tinycc DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
