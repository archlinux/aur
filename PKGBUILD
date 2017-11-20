# Maintainer: vltr <rkuesters@gmail.com>
pkgname=postgresql-unit-git
pkgver=4.0.r2.g7845111
pkgrel=1
pkgdesc="SI Units for PostgreSQL"
url="https://github.com/ChristophBerg/postgresql-unit"
arch=('any')
license=('GPL3')
depends=('postgresql')
makedepends=('postgresql-libs' git)
source=(git+https://github.com/ChristophBerg/postgresql-unit)
sha1sums=('SKIP')

pkgver() {
	cd postgresql-unit
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd postgresql-unit
	make
}

package() {
	cd postgresql-unit
	make DESTDIR=${pkgdir} install
}
