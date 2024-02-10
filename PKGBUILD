# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=pikchr-fossil
pkgver=r403.d9ee756
pkgrel=1
pkgdesc='PIC-like markup language for diagrams in technical documentation'
arch=('x86_64')
url='https://pikchr.org/'
license=('BSD')
makedepends=('fossil')
provides=("${pkgname%-fossil}")
conflicts=("${pkgname%-fossil}")
source=("${pkgname%-fossil}::fossil+https://pikchr.org/home")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname%-fossil}

	_hash=$(fossil info | sed -n 's/checkout: *\([0-9a-z]*\).*/\1/p' | cut -c 1-7)
	_revision=$(fossil info | sed -n 's/check-ins: *\(.*\)/\1/p')
	printf "r%s.%s" "$_revision" "$_hash"
}

build() {
	make -C ${pkgname%-fossil}
}

package() {
	cd ${pkgname%-fossil}

	install -Dm755 pikchr $pkgdir/usr/bin/pikchr
	install -dm755 $pkgdir/usr/share/licenses/pikchr
	sed -En '3,8s/^.?.?.?//p' pikchr.y > $pkgdir/usr/share/licenses/pikchr/LICENSE
}
