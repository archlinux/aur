# Maintainer: Nico Jansen <aur@nzbr.de>

pkgname=vlogsolv
pkgver=1.0b
pkgrel=1
pkgdesc="cli program that calculates value tables for logical expressions"
arch=('x86_64')
url="https://github.com/nzbr/vlogsolv"
license=('ISC')
depends=()
makedepends=('git' 'gcc' 'make')
source=("$pkgname-$pkgver::git+https://github.com/nzbr/vlogsolv.git#tag=v$pkgver"
        "v::git+https://github.com/vlang/v.git")
sha512sums=('SKIP'
            'SKIP')

prepare() {
	cd "v"

	VFLAGS="-prod -cc gcc -show_c_cmd" make
}

build() {
	cd "$pkgname-$pkgver"

	../v/v -o vlogsolv -prod -cc gcc -show_c_cmd .
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 vlogsolv  "$pkgdir/usr/bin/vlogsolv"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/vlogsolv/LICENSE"
}
