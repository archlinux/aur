# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=openbsd-manpages
pkgver=6.2
pkgrel=2
pkgdesc="The OpenBSD manual pages."
arch=('x86_64')
url="https://man.openbsd.org/"
license=('BSD')
source=("https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/man${pkgver//./}.tgz"
        "https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/xshare${pkgver//./}.tgz")
sha256sums=('7e47ac7364ffad253ba7b3e759e7e4e8f16da58d7f320eb0b47f09c3e647f408'
            '521760064b6920afea25fe1ffa36793d8acfb1cb0c0d921cb768688d7cbc3f32')

prepare() {
  msg2 'Renaming man pages for consistency with linux man pages.'	
  cd ${srcdir}/usr/share/man
  find . -type f -exec mv '{}' '{}openbsd' \;
  cd ${srcdir}/usr/X11R6/man
  find . -type f -exec mv '{}' '{}openbsd' \;
}

package() {
  install -d $pkgdir/usr/share/man
  cd ${srcdir}/usr/share/man
  cp -a ./man* $pkgdir/usr/share/man/
  cd ${srcdir}/usr/X11R6/man
  cp -a ./man* $pkgdir/usr/share/man/
}
# vim:set ts=2 sw=2 et:
