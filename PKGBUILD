# Maintainer: Ido Perlmuter <ido@ido50.net>
# Contributor: tee < teeaur at duck dot com >
pkgname=sqlar-fossil
_pkg="${pkgname%-fossil}"
pkgver=4824e73896
pkgrel=1
pkgdesc="Compressed archives in SQLite databases, including a fuse filesystem"
arch=(x86_64)
url="https://sqlite.org/sqlar"
license=('Public Domain')
makedepends=('fossil')
depends=('fuse2' 'glibc' 'zlib')
provides=("${_pkg}")
conflicts=("${_pkg}")
source=("fossil+$url")
sha1sums=(SKIP)

pkgver() {
	cd "${_pkg}"
	fossil timeline -t ci --format %h -n 1 | head -n 1
}

build() {
	cd "${_pkg}"
	CFLAGS="$CFLAGS -Wno-misleading-indentation -Wno-return-local-addr" make all
}

package() {
	cd "${_pkg}"
	install -Dvm755 sqlar sqlarfs -t "${pkgdir}/usr/bin/"
	install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_pkg}/"
}
