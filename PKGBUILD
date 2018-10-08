# Maintainer: Lukas Hannen <plant dot software dot c at hannen dot at>

pkgname=plant-git
pkgver=v1.0.3
pkgrel=1
pkgdesc="tree but for arbitrary data"
arch=(any)
url="https://github.com/qbe/plant"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/qbe/plant.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 755 plant "$pkgdir/usr/bin/plant"
	install -Dm 644 MANPAGE "$pkgdir/usr/share/man/man1/plant.1"
	gzip "$pkgdir/usr/share/man/man1/plant.1"
}
