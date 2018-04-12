# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=openbsd-manpages
pkgver=6.3
pkgrel=1
pkgdesc="The OpenBSD manual pages."
arch=('x86_64')
url="https://man.openbsd.org/"
license=('BSD')
source=("https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/man${pkgver//./}.tgz"
        "https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/xshare${pkgver//./}.tgz")
sha256sums=('331cab3ea89f81157f8cc111fb8b4eaba3bb6c6decd74e59521d2447208619b1'
            '5a91ebd61ad8d64c0d98d07bbd80f9c8346b12fa5c61bdad36a8b107179ed3bd')

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
