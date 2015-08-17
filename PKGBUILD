# Contributor: Ovi Chis ovi@ovios.org
pkgname=tgt
pkgver=1.0.60
pkgrel=1
pkgdesc="iSCSI TGT Daemon and userspace tools"
arch=('x86_64' 'i686')
url="http://stgt.sourceforge.net/"
license=('GPL')
depends=('perl-config-general' 'libxslt')
optdepends=('sg3_utils')
backup=('etc/tgt/targets.conf')
source=(https://github.com/ksovi/tgt/archive/v$pkgver.tar.gz
tgtd.service)
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make ISCSI=1 PREFIX="$pkgdir" || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644  "$srcdir/tgtd.service" "$pkgdir/usr/lib/systemd/system/tgtd.service"
}

# vim:set ts=2 sw=2 et:
md5sums=('605d3d2d45f780f2d2010004c513d68e'
         'b69ec0100191627d415a1f0a5a2ffbc8')
