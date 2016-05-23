# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-deezer-git
pkgver=2.4.r0.gdd9c16d
pkgrel=1
pkgdesc='Deezer integration for Nuvola Player.'
arch=('any')
url='https://github.com/tiliado/nuvola-app-deezer'
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-deezer.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
