# Maintainer: Dhananjay Sathe <dhananjaysathe@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-rdio-git
pkgver=r8.52a785d
pkgrel=1
pkgdesc="Rdio integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-rdio"
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-rdio.git")
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
