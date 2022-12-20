#Maintainer: Ovi Chis ovi@ovios.org
pkgname=tgt
pkgver=1.0.84
pkgrel=1
pkgdesc="iSCSI Target STGT for Arch Linux"
arch=('x86_64' 'i686' 'arm')
url="http://stgt.sourceforge.net/"
license=('GPL')
depends=('perl-config-general' 'libxslt' 'docbook-xsl')
optdepends=('sg3_utils')
backup=('etc/tgt/targets.conf')
source=(https://github.com/fujita/tgt/archive/v$pkgver.tar.gz)
md5sums=('0fda4666ba0d80e64b81c01232555636')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make sbindir=/usr/bin ISCSI=1 PREFIX="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" sbindir=/usr/bin install
  install -Dm644 "$srcdir/$pkgname-$pkgver/scripts/tgtd.service" "$pkgdir/usr/lib/systemd/system/tgtd.service"
}

