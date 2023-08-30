# Maintainer: Angelo Haller <aur.archlinux@szanni.org>
pkgname=stripzip-git
pkgver=r6.d55bce7
pkgrel=1
pkgdesc="Utility to remove metadata from ZIP files to facilitate repeatable/reproducible/deterministic builds."
arch=('x86_64')
url="https://github.com/KittyHawkCorp/stripzip"
license=('BSD')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('stripzip::git+https://github.com/KittyHawkCorp/stripzip.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -D -m755 stripzip "${pkgdir}/usr/bin/stripzip"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
