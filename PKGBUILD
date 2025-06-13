# Maintainer: envolution
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: kusakata <shohei atmark kusakata period com>
# Contributor: jperry <sh.jperry@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gworkspace
pkgver=1.1.0
pkgrel=1
pkgdesc="The GNUstep Workspace"
arch=("x86_64")
url="http://www.gnustep.org/experience/GWorkspace.html"
license=('GPL-2.0-only')
depends=(gnustep-pdfkit gnustep-base gnustep-back gnustep-gui)
makedepends=('gcc-objc' 'gnustep-make')
source=(https://ftp.gnustep.org/pub/gnustep/usr-apps/gworkspace-${pkgver}.tar.gz)
md5sums=('84737d04c7471b9d928d7ca9a38ff2eb')

_gnustep() {
  source /usr/share/GNUstep/Makefiles/GNUstep.sh
}

prepare() {
  cd $srcdir/$pkgname-$pkgver
  _gnustep && ./configure --with-inotify --prefix=/opt/GNUstep
}

build() {
  cd $srcdir/$pkgname-$pkgver
  _gnustep && make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  _gnustep && make DESTDIR=$pkgdir install
}
# vim:set ts=2 sw=2 et:
