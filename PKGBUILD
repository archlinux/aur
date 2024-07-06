# Maintainer: willemw <willemw12@gmail.com>
# Contributor : Caleb McKay <caleb@candj.us>
# Contributor : Romain Gautier <romain.gautier@nimamoh.net>,Jameson Pugh <imntreal@gmail.com>

pkgname=btrfsmaintenance
pkgver=0.5.2
pkgrel=1
pkgdesc='Btrfs maintenance scripts'
arch=(any)
url=https://github.com/kdave/btrfsmaintenance
license=(GPL-2.0-or-later)
depends=(btrfs-progs)
backup=(etc/default/btrfsmaintenance)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('f41f5c8a697420c282c603d96f70b25a6f4d3bf330fa0249625bce256e0cce2e')

prepare() {
  #sed -i 's| /usr/share| "'$pkgdir'"/usr/share|g' $pkgname-$pkgver/dist-install.sh
  sed -i 's|/etc/sysconfig/|/etc/default/|' $pkgname-$pkgver/btrfsmaintenance-refresh.path
}

package() {
  cd $pkgname-$pkgver

  install -Dm644 sysconfig.btrfsmaintenance "$pkgdir/etc/default/btrfsmaintenance"

  install -Dm644 btrfsmaintenance-refresh.path -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ./*.service ./*.timer -t "$pkgdir/usr/lib/systemd/system"

  install -Dm755 btrfs-*.sh btrfsmaintenance-refresh-cron.sh -t "$pkgdir/usr/share/btrfsmaintenance"
  install -Dm644 btrfsmaintenance-functions README.md -t "$pkgdir/usr/share/btrfsmaintenance"

  #./dist-install.sh "$pkgdir/etc/default"
}
