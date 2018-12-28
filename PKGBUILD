# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jesús Castro <51v4n@openmailbox.org>
pkgname=freebsd-man-pages
pkgver=12.0
pkgrel=1
pkgdesc="The FreeBSD manual pages."
arch=('x86_64')
url="https://www.freebsd.org/cgi/man.cgi"
license=('BSD')
provides=('freebsd-manpages')
conflicts=('freebsd-manpages')
source=("freebsd-base-${pkgver}.txz::http://ftp.freebsd.org/pub/FreeBSD/releases/amd64/amd64/$pkgver-RELEASE/base.txz")
sha256sums=('360df303fac75225416ccc0c32358333b90ebcd58e54d8a935a4e13f158d3465')

prepare() {
  cd ./usr/share/man
  msg2 'Renaming man pages for consistency with linux man pages.'
  find . -iname "*.gz" -exec rename .gz freebsd.gz '{}' \;
}

package() {
  cd ./usr/share/man
  install -d $pkgdir/usr/share/man
  cp -a ./man{1..9} $pkgdir/usr/share/man/
}
# vim:set ts=2 sw=2 et:
