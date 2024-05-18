# Maintainer: SelfRef <arch@selfref.dev>

pkgname="asus-stylus-driver"
pkgver=1.1.1
pkgrel=1
pkgdesc="Supplement driver for Asus Pen stylus"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-stylus-driver"
license=('GPL-2.0')
depends=('python' 'python-libevdev' 'libevdev')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/asus-linux-drivers/asus-stylus-driver.git#tag=v$pkgver")
install=layout.install
md5sums=('c87a2c3245415b6d9217ac21203544e1')

package() {
	cd ${pkgname}
	install -Dm644 -t "$pkgdir/usr/share/asus_stylus-driver" asus_stylus.py
	install -Dm644 -t "$pkgdir/usr/share/asus_stylus-driver/stylus_layouts" stylus_layouts/*
	install -dm755 "$pkgdir/var/log/asus_stylus-driver"

	_default_layout=$(basename -s .py $(ls stylus_layouts | head -n 1))
	sed -i "s/\$LAYOUT/$_default_layout/" asus_stylus.service
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" asus_stylus.service

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
