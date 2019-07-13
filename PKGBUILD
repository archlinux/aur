# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=infgen-git
pkgdesc="Deflate disassember to convert a deflate, zlib, or gzip stream into a readable form"
pkgver=15.f0ae732
pkgrel=1
arch=(x86_64)
url="https://github.com/madler/infgen"
license=('custom:personal-enlightment')
depends=(glibc)
makedepends=(git)
source=(git+ssh://git@github.com/madler/infgen)
sha1sums=(SKIP)

pkgver() {
	cd infgen
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd infgen
	gcc $CFLAGS $LDFLAGS infgen.c -o infgen
	sed -ne '/# License/,$p' README.md > LICENSE
}

package() {
	cd infgen
	install -Dm755 infgen "$pkgdir/usr/bin/infgen"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
