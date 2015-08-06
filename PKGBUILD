# Contributor: Ovi Chis ovi@ovios.org
pkgname=tgt
pkgver=1.0.60
pkgrel=1
pkgdesc="tgt daemon and userspace tools (ISCSI Support)"
arch=('x86_64' 'i686')
url="http://stgt.sourceforge.net/"
license=('GPL')
depends=('perl-config-general' 'libxslt')
optdepends=('sg3_utils')
backup=('etc/tgt/targets.conf')
source=(https://github.com/ksovi/tgt/archive/v$pkgver.tar.gz
tgtd.service)
md5sums=('5956ced52446802db9f5f8ff65e3bda2'
         'c9d573d4dbbf5b424c4041fe13ada55a')

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
