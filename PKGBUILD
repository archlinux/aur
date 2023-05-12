# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.1.5
pkgrel=1
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL')
depends=("lvm2" "bc")
install="$pkgname.install"
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('29a9121b3279aa47c10d7fcb1f40e748a02a69d84cf9fe56207f8a0b1bbd2324'
            '98cebca98f1f94e33653fbb2b81c305877f466076298204413c3e929fa051443')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	chmod +x make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh
	cp make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh "$pkgdir/usr/bin"
	cp monitor_lvm_snapshot_usage.service monitor_lvm_snapshot_usage.timer "$pkgdir/etc/systemd/system"
	cp make-lvm-snapshot.target make-lvm-snapshot.service "$pkgdir/etc/systemd/system"
}
