# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=make-lvm-snapshot
pkgver=0.2.5
pkgrel=1
pkgdesc="Make a consistent LVM snapshot of the root volume"
arch=('any')
url="https://gitlab.com/Marcool04/$pkgname/"
license=('GPL')
depends=(
  'bc'
  'bash'
  'jq'
  'lvm2'
)
install="$pkgname.install"
source=("${url}/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install")
sha256sums=('5413238ba3d41e7113eeab377d3e81944cd4d99966e7e1be820a92b110b785bd'
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
	cp monitor_lvm_snapshot_usage.service "$pkgdir/usr/lib/systemd/system/"
	cp make-lvm-snapshot.target make-lvm-snapshot.service "$pkgdir/usr/lib/systemd/system/"
}
