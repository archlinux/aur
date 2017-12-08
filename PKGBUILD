# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=freebsd-docs-handbook
pkgver=r51261
pkgrel=1
pkgdesc="The FreeBSD Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("${pkgname}.book.html-split.${pkgver}.tar.bz2::ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/handbook/book.html-split.tar.bz2")
sha256sums=('659b63316d93ffe60a118935dd416024b37c4400a9588ba34b1d72fe70b0e6db')

prepare() {
  rm ${pkgname}.book.html-split.${pkgver}.tar.bz2
  msg2 'Correcting paths in html files'
  for j in $(ls $srcdir/*.html); do
    sed -i 's:/local0/docbuild/build/doc/en_US.ISO8859-1/books/handbook/../../../share/images/books:/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books:g' $j        
  done 
}
package() {
  install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/handbook
  cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/handbook/
}
# vim:set ts=2 sw=2 et:
