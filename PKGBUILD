# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=lookupunicode
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r17.d8ccac2
pkgdesc="swizz army knife for unicode - a utility to search in the unicode database"
arch=('any')
url="https://codeberg.org/nycex/${_pkgbasename}"
license=('GPL3')
depends=('zig' 'unicode-character-database')
source=(git+${url})
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	zig build -Drelease-fast
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	install -D -m755 zig-cache/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
