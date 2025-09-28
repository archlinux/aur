# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=mrpack-install
pkgname="$_pkgbase"
pkgver=0.21.0.beta
pkgrel=2
pkgdesc="Modrinth Modpack server deployment"
arch=('any')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
source=("$_pkgbase::git+https://github.com/nothub/mrpack-install.git#tag=v${pkgver/\.beta/-beta}")
sha256sums=('6ee61a55b741fbe3d1b4d82e2a79f29b5bd07c68184f672963ffc633de7e4b63')
makedepends=('go' 'goreleaser')

build() {
	cd "$_pkgbase"
	goreleaser build --clean --single-target
}

package() {
	install -Dm755 "$_pkgbase"/dist/mrpack-install*/mrpack-install "$pkgdir"/usr/bin/mrpack-install
	install -Dm644 "$_pkgbase"/LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgbase"/LICENSE.txt
}
