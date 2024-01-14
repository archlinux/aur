# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.2.4
pkgrel=1
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL')
depends=("lvm2" "bc" "bash")
install="$pkgname.install"
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('6a74f54282cbf7641917da029c0d7306dfd3cd47ad164002f54590a33ae8fe0e'
            '962eb8638df86c2bbff5691d6e828abe6ef119974fadca103ebc4f98e87341c4')
backup=('etc/default/make-lvm-snapshot')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	mkdir -p "$pkgdir/etc/default/"
	touch "$pkgdir/etc/default/make-lvm-snapshot"
	chmod +x make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh
	cp make-lvm-snapshot.sh monitor_lvm_snapshot_usage.sh "$pkgdir/usr/bin"
	cp monitor_lvm_snapshot_usage.service monitor_lvm_snapshot_usage.timer "$pkgdir/usr/lib/systemd/system/"
	cp make-lvm-snapshot.target make-lvm-snapshot.service "$pkgdir/usr/lib/systemd/system/"
}
