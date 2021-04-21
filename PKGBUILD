# Maintainer: theokonos
# Contributors: dekart811

pkgname=veeam
pkgver=5.0.0.4318
pkgrel=9
pkgdesc="Veeam Agent for Linux"
arch=('x86_64')
url=http://repository.veeam.com/backup/linux/agent
install=${pkgname}.install
license=('custom')
depends=('ncurses' 'lvm2' 'fuse' 'mlocate')
source=( "$url/rpm/el/8/x86_64/veeam-$pkgver-1.el8.x86_64.rpm" )
sha256sums=('6c4cdf522868e376050ce7969194451d9d2c73f48419928aeceff58b3d8e827e')
noextract=("$pkgname-$pkgver-1.el8.x86_64.rpm")
backup=('etc/veeam/veeam.ini' 'usr/share/veeam/lpb_scheme.sql' 'usr/share/veeam/db_upgrade.sql' 'usr/share/veeam/db_scheme.sql' 'var/lib/veeam/veeam_db.sqlite' 'var/lib/veeam/veeam_db.sqlite-shm' 'var/lib/veeam/veeam_db.sqlite-wal')

package() {
  bsdtar -xf $pkgname-$pkgver-1.el8.x86_64.rpm -C "$pkgdir" -s /sbin/bin/ -s '|lib/systemd|usr/lib/systemd|'
  sed -i -e 's|/var/run|/run|' -e 's|/sbin|/bin|' "$pkgdir"/usr/lib/systemd/system/veeamservice.service
  rm -rf "$pkgdir"/usr/lib/.build-id/
  install -d  "$pkgdir"/usr/share/licenses/$pkgname/
  ln -s ../../doc/$pkgname/EULA "$pkgdir"/usr/share/licenses/$pkgname/
  ln -s ../../doc/$pkgname/3rdPartyNotices.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
