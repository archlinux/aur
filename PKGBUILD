# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=nuvola-app-yandex-music-git
pkgver=r10.cce65a0
pkgrel=1
pkgdesc="Yandex Music integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-yandex-music"
license=('custom:BSD')
depends=('nuvolaplayer')
provides=('nuvola-app-yandex-music')
conflicts=('nuvola-app-yandex-music')
makedepends=('git' 'scour')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-yandex-music.git")
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
    cp LICENSE-BSD.txt LICENSE
}

package() {
	cd "$pkgname"
	install -vCDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
