# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix von Perger <frekkvb@gmail.com>
# Contributor: tee < teeaur at duck dot com >
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libthreadar
pkgver=1.6.1
pkgrel=1
pkgdesc='C++ library manage threads and any type to exception between them'
arch=('x86_64')
url='http://libthreadar.sourceforge.net'
license=('LGPL-3.0-only' 'GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('automake' 'libtool' 'autoconf' 'doxygen' 'man-db' 'groff')
provides=("libthreadar.so=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Edrusb/libthreadar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84b76be23b3d4cfc25c36fe961f9c07a6c4754ea48fb670d1c0520a544cf8797')

prepare() {
  cd "$pkgname-$pkgver"

  # unbreak build (this is not installed, yet always built, and is broken)
  sed -r 's|(-all)?-static||' -i doc/examples/Makefile.am

  misc/init
  #cp -av build/{configure.ac,Makefile.am,ChangeLog} -t .
  #autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static --enable-shared
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install pkgdatadir="/usr/share/doc/$pkgname/html"
  install -Dm644 AUTHORS README THANKS -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
