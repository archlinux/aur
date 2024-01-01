# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.1.12
pkgrel=1
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL')
depends=("lvm2" "bc" "bash")
install="$pkgname.install"
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('fbc91242da79686d12c0c936f15355aa723379261da11c5c6ec7f09a5f2cb007'
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
