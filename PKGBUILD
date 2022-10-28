# Maintainer: Vitaliy Berdinskikh <ur6lad at tuta dot io>
pkgname='xkblayout'
pkgver='1.3'
pkgrel='2'
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
	gzip "$pkgname.1"
}

package() {
	cd "$pkgname-$pkgver"

	install -d "$pkgdir"/usr/bin
	install -m 755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
	
	install -d "$pkgdir"/usr/share/man/man1
	install -m 644 "$pkgname.1.gz" "$pkgdir"/usr/share/man/man1/"$pkgname.1.gz"
	
	install -d "$pkgdir"/usr/share/licenses/"$pkgname"
	install -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
