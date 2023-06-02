# Maintainer: nycex <nycex / cccp.org>
_pkgbasename=zls
pkgname=${_pkgbasename}-git
pkgrel=1
pkgver=r1683.f96b226
pkgdesc="Zig LSP implementation + Zig Language Server"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/zigtools/${_pkgbasename}"
provides=('zls')
conflicts=('zls')
replaces=('zls-master-data-git')
license=('MIT')
depends=('zig')
makedepends=('git')
source=(git+https://github.com/zigtools/${_pkgbasename})
sha256sums=('SKIP')
            
pkgver() {
	cd "${srcdir}/${_pkgbasename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbasename}"
	zig build -Doptimize=ReleaseSafe
}

package() {
	cd "${srcdir}/${_pkgbasename}"

	install -D -m755 zig-out/bin/$_pkgbasename "${pkgdir}/usr/bin/$_pkgbasename"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbasename/LICENSE"
}
