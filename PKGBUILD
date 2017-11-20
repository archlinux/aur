# Maintainer: vltr <rkuesters@gmail.com>
pkgname=pg_hashids-git
pkgver=r8.d00cfb1
pkgrel=1
pkgdesc="Short unique id generator for PostgreSQL, using hashids"
url="https://github.com/iCyberon/pg_hashids"
arch=('any')
license=('MIT')
depends=('postgresql')
makedepends=('postgresql-libs' git)
source=(git+https://github.com/iCyberon/pg_hashids)
sha1sums=('SKIP')

pkgver() {
	cd pg_hashids
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd pg_hashids
	make
}

package() {
	cd pg_hashids
	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
