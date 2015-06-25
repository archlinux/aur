# Previous contributor: Michal Hybner <dta081@gmail.com>
pkgname=xtrlock
pkgver=2.7
pkgrel=1
pkgdesc="Minimal X display lock program"
arch=('i686' 'x86_64')
url="http://packages.debian.org/xtrlock"
license=('GPL')
depends=('libx11')
source=(http://ftp.debian.org/debian/pool/main/x/xtrlock/xtrlock_${pkgver}.tar.gz)
sha1sums=('1d9ad15b9bb8d2f24476e2c01dc1fa807c7e47ba')
#changelog=${pkgname}_${pkgver}_changelog

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -f Makefile.noimake CFLAGS="${CFLAGS} -DSHADOW_PWD" LDLIBS="-lX11 -lcrypt" xtrlock
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D --mode=4755 --verbose xtrlock ${pkgdir}/usr/bin/xtrlock
  install -D --mode=644 --verbose xtrlock.man ${pkgdir}/usr/share/man/man1/xtrlock.1x
}

# vim:set ts=2 sw=2 et:
