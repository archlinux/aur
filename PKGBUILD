# $Id: PKGBUILD,v 1.7 2007/11/15 23:53:12 daniel Exp $
# Maintainer: Judd Vinet <judd@archlinux.org>
pkgname=bridge-utils
pkgver=1.2
pkgrel=2
pkgdesc="Layer2 ethernet bridging for Linux"
arch=(i686 x86_64)
url="http://bridge.sourceforge.net/"
backup=('etc/conf.d/bridges')
depends=('glibc')
source=(http://heanet.dl.sourceforge.net/sourceforge/bridge/bridge-utils-$pkgver.tar.gz bridges.conf.d)
md5sums=('1e6cff57ac90d7ab984d9512fdd9f2dd' 'f5d691282653580dd5fd4a1092ef365b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  aclocal
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../bridges.conf.d $startdir/pkg/etc/conf.d/bridges
}
