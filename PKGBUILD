# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=asus-stylus-driver
pkgname="$_pkgbase"
pkgver=1.2.0
pkgrel=1
pkgdesc="Supplement driver for Asus Pen stylus"
arch=('any')
url="https://github.com/asus-linux-drivers/asus-stylus-driver"
license=('GPL-2.0')
depends=('python' 'python-libevdev' 'libevdev')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/asus-linux-drivers/asus-stylus-driver.git#tag=v$pkgver")
install=layout.install
sha256sums=('acc825ff772e2a1d06bd3e1ae0a59ea9cb2bc489f67cb3c22eac8cb72130082e')

package() {
	cd ${pkgname}

	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" src/asus-stylus.service

	install -dm755 "$pkgdir/var/log/asus-stylus"
	install -dm755 "$pkgdir/etc/asus-stylus"
	cat src/config.ini | LAYOUT=SA201H envsubst '$LAYOUT' > "$pkgdir/etc/asus-stylus/config.ini"

	install -Dm644 -t "$pkgdir/usr/lib/asus-stylus" src/asus-stylus.py
	install -Dm644 -t "$pkgdir/usr/lib/asus-stylus/layouts" src/layouts/*
	install -Dm755 -t "$pkgdir/usr/bin" src/asus-stylus

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
