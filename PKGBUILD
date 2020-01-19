# Maintainer: Hendrik Werner <hendrik.to@gmail.com>

pkgname=battery_warning
pkgver=1.2
pkgrel=1
pkgdesc='Warn if the battery capacity drops too low'
arch=('x86_64')
url='https://github.com/Hendrikto/battery_warning'
license=('MIT')
depends=('i3-wm')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/Hendrikto/battery_warning.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git checkout $pkgver
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR=$pkgdir prefix=/usr systemd_prefix=/usr/lib install
	install -D -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
