# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=ne
pkgver=3.1.0
pkgrel=1
pkgdesc='The nice editor, a fast small powerful and simple to use editor'
arch=('i686' 'x86_64')
url='http://ne.di.unimi.it'
license=('GPL3')
depends=('ncurses' 'texinfo')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('64f28c5b8af4664efaaba62edad9df5a')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i -e 's/build: docs/build:/' makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  export MAKEFLAGS="-j1"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}/" install
}
