# $Id: PKGBUILD 75557 2010-04-01 20:23:24Z giovanni $
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Olivier Galibert <galibert@pobox.com>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=nbsmtp
pkgver=1.00
pkgrel=3
pkgdesc="No-Brainer SMTP client suitable to run in chroot jails, embeded systems, laptops, and workstations"
arch=(i686 x86_64)
url="http://nbsmtp.ferdyx.org/"
license=('GPL')
depends=('openssl')
source=(http://www.it.uc3m.es/~ferdy/nbsmtp/$pkgname-$pkgver.tar.bz2 build.patch)
md5sums=('0c6a200027a6f7f61f44b374261aa52f' '043236152fecb550d80ab3cd84711cd3')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i ../build.patch || return 1
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-ssl || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install || return 1
}
