# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=zls
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r4.999a365
pkgdesc="Zig LSP implementation + Zig Language Server"
arch=('any')
url="https://github.com/SuperAuguste/${_pkgbasename}"
license=('MIT')
depends=('zig')
source=(git+https://github.com/SuperAuguste/${_pkgbasename})
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
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/license/$_pkgbasename/LICENSE"
}
