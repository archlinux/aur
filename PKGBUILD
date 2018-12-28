# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=openbsd-manpages
pkgver=6.4
pkgrel=1
pkgdesc="The OpenBSD manual pages."
arch=('x86_64')
url="https://man.openbsd.org/"
license=('BSD')
source=("https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/man${pkgver//./}.tgz"
        "https://ftp.openbsd.org/pub/OpenBSD/${pkgver}/amd64/xshare${pkgver//./}.tgz")
sha256sums=('103c9d441b33fbb3b56ada9a0db8c443e51137a914ef953ff4c592c7c867208a'
            'ef377b4810dcb110b138b94f3df8b6640b399eabd7678a76009eb85acb633ca0')

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
