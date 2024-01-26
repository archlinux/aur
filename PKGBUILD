# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.3.2
pkgrel=1
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL-3.0-or-later')
depends=(
  'bc'
  'bash'
  'jq'
  'lvm2'
)
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('07a037122df282be4927d4ea601c8e06d71c42c0da7154c7837d071554c52eaa')
backup=('etc/default/make-lvm-snapshot')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	mkdir -p "$pkgdir/etc/default/"
	touch "$pkgdir/etc/default/make-lvm-snapshot"
	chmod +x make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh snapshot-root-lvm-on-reboot.sh
	cp make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh snapshot-root-lvm-on-reboot.sh "$pkgdir/usr/bin"
	cp monitor_lvm_snapshot_usage.service "$pkgdir/usr/lib/systemd/system/"
	cp make-lvm-snapshot.target make-lvm-snapshot.service "$pkgdir/usr/lib/systemd/system/"
}
