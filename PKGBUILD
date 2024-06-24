# Maintainer: willemw <willemw12@gmail.com>
# Contributor : Caleb McKay <caleb@candj.us>
# Contributor : Romain Gautier <romain.gautier@nimamoh.net>,Jameson Pugh <imntreal@gmail.com>

pkgname=btrfsmaintenance
pkgver=0.5.1
pkgrel=1
pkgdesc='Btrfs maintenance scripts'
arch=(any)
url=https://github.com/kdave/btrfsmaintenance
license=(GPL-2.0-or-later)
depends=(btrfs-progs)
backup=(etc/default/btrfsmaintenance)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('305998224fd8fa6bbca474d6fe8e23be9c2ae4d6f47e398a76b117e57a9d9056')

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
