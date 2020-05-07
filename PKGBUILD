# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=zls
pkgname=${_pkgbasename}-master-data-git
pkgrel=1
pkgver=r32.042b47a
pkgdesc="Zig LSP implementation + Zig Language Server (with the master dataset)"
arch=('any')
url="https://github.com/SuperAuguste/${_pkgbasename}"
license=('MIT')
depends=('zig')
conflicts=('zls-git')
source=(git+https://github.com/SuperAuguste/${_pkgbasename})
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	zig build -Drelease-fast -Ddata_version=master
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	install -D -m755 zig-cache/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/license/$_pkgbasename/LICENSE"
}
