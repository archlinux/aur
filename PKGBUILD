# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.3.3
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
sha256sums=('4f65678e22c4c994d3e0933342694edf3ba85d3e5efa14ec0936f5c1da05f1fc')
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
