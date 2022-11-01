# Previous maintainer: Vitaliy Berdinskikh <ur6lad at tuta dot io>
# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>

pkgname='xkblayout'
pkgver='1.3'
pkgrel='4'
pkgdesc='Print the current xkb keyboard layout'
arch=('x86_64')
url='https://github.com/alenichev/xkblayout'
license=('custom')
depends=('libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alenichev/$pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('cba655d3cd6e779d73da28cf41729d94bcf5fc6968af0dd922fa6189099e58e9')

prepare() {
	cd "$pkgname-$pkgver"
	awk '/Copyright \(c\)/,/THIS SOFTWARE\./' strlcpy.c xkblayout.c | sed 's/^[ *]\+//' > LICENSE
}

build() {
	cd "$pkgname-$pkgver"
	make clean all
	gzip -f "$pkgname.1"
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -m 644 "$pkgname.1.gz" "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
