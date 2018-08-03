# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Jesús Castro <51v4n@openmailbox.org>
pkgname=freebsd-current-man-pages
pkgver=12.0
pkgrel=1
epoch=1
pkgdesc="The FreeBSD manual pages."
arch=('x86_64')
url="https://www.freebsd.org/cgi/man.cgi"
license=('BSD')
provides=('freebsd-manpages')
conflicts=('freebsd-manpages' 'freebsd-man-pages')
source=("http://ftp.freebsd.org/pub/FreeBSD/snapshots/amd64/amd64/$pkgver-CURRENT/base.txz")
sha256sums=('65bfa671fe766678e70d7c625877b3079e7b3205e92d1e6daec8a7299edeac2b')

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
