# Maintainer: Daurnimator <quae@daurnimator.com>
pkgname=pgjwt-git
pkgver=r28.546a291
pkgrel=1
pkgdesc="PostgreSQL implementation of JWT (JSON Web Tokens) "
url="https://github.com/michelp/pgjwt"
arch=('any')
license=('MIT')
depends=('postgresql')
makedepends=('postgresql-libs')
source=(git+https://github.com/michelp/pgjwt)
sha1sums=('SKIP')

pkgver() {
	cd pgjwt

	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd pgjwt

	make
}

package() {
	cd pgjwt

	make DESTDIR=${pkgdir} install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
