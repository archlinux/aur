#Maintainer: Ovi Chis ovi@ovios.org
pkgname=tgt
pkgver=1.0.61
pkgrel=1
pkgdesc="iSCSI Target STGT for Arch Linux"
arch=('x86_64' 'i686')
url="http://stgt.sourceforge.net/"
license=('GPL')
depends=('perl-config-general' 'libxslt')
optdepends=('sg3_utils')
backup=('etc/tgt/targets.conf')
source=(https://github.com/ksovi/tgt/archive/v$pkgver.tar.gz)
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make ISCSI=1 PREFIX="$pkgdir" || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644  "$srcdir/$pkgname-$pkgver/tgtd.service" "$pkgdir/usr/lib/systemd/system/tgtd.service"
}

# vim:set ts=2 sw=2 et:

md5sums=('c03d0695818e5b249e297340d26e749c')
