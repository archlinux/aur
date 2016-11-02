# Maintainer: Jonas Frei freijon <freijon@gmail.com>

pkgname=nuvola-app-digitally-imported-git
pkgver=r0.39115fb
pkgrel=1
pkgdesc="Digitally Imported integration for Nuvola Player."
arch=('any')
url="https://github.com/ItzBlitz98/nuvola-app-digitally-imported"
license=('custom: BSD')
depends=('nuvolaplayer')
makedepends=('git')
source=("${pkgname}::git+https://github.com/ItzBlitz98/nuvola-app-digitally-imported.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
	install -vCDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
