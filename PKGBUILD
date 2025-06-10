# Maintainer: envolution
# Contributor: Thien An Dang Thanh <thienandangthanh@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jared Casper <jaredcasper@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gerbv
pkgver=2.10.0
pkgrel=4
pkgdesc="Gerber file (RS-274X only) viewer - w/ fork patches"
#dead original link url="http://gerbv.gpleda.org/"
#dead original link url="http://gerbv.geda-project.org/"
url='https://github.com/gerbv/gerbv'
license=('GPL-2.0-only')
arch=('x86_64')
depends=('gtk2' 'dconf')
optdepends=('cairo: for better graphics')
_tag='7c1553da070b4585e45b5550f7ba2f9a0b37450b'
source=("gerbv-$pkgver.${_tag}::git+https://github.com/gerbv/gerbv.git#tag=${_tag}")
sha256sums=('e6bf4247d0acbcf712950008dea207405362a97e6824cf305a417fca1cc73a89')

prepare() {
  cd $pkgname-$pkgver.$_tag
  sed -i "21 i VERSION=$pkgver" src/Makefile.am
  sed -i "64 i #define VERSION \"$pkgver\"" src/gerbv.h
}
build () {
  cd $pkgname-$pkgver.$_tag
  ./autogen.sh
  ./configure --prefix=/usr \
              --disable-update-desktop-database \
              CFLAGS="-g -O2 -std=c17 -D_GNU_SOURCE"
  make
}

package() {
  cd $pkgname-$pkgver.$_tag
  make DESTDIR="$pkgdir" install 
}

# vim:set ts=2 sw=2 et:
