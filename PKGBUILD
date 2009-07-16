# $Id: PKGBUILD,v 1.2 2009/04/09 09:51:51 sergej Exp $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: scj <scj(at)archlinux(dot)us>
pkgname=incron
pkgver=0.5.8
pkgrel=1
pkgdesc="Like the regular cron but is driven by filesystem events instead of time periods"
arch=('i686' 'x86_64')
url="http://incron.aiken.cz/"
license=("GPL")
depends=('gcc-libs')
install=incron.install
source=(http://inotify.aiken.cz/download/incron/$pkgname-$pkgver.tar.gz \
	incron.init)
options=(emptydirs)
md5sums=('d8feb245b839b1b8855cf471f84c7588'
         '648e1ca1a4b1e624401d9d71aa3756b3')


build() {
  cd $startdir/src/$pkgname-$pkgver
  
  install -D -m 755 $startdir/incron.init $startdir/pkg/etc/rc.d/incrond
  mkdir -p $startdir/pkg/usr/share/man $startdir/pkg/usr/bin $startdir/pkg/usr/sbin

  make || return 1

  make PREFIX=$startdir/pkg/usr \
    MANPATH=$startdir/pkg/usr/share/man \
    USERDATADIR=$startdir/pkg/var/spool/incron \
    CFGDIR=$startdir/pkg/etc \
    SYSDATADIR=$startdir/pkg/etc/incron.d install
}
