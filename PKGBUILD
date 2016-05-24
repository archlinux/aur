# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-logitech-media-server-git
pkgdesc='Logitech Media Server integration for Nuvola Player'
pkgver=2.0.r0.g40065d8
pkgrel=1

license=('BSD')

# template start; name=nuvola-app-git; version=1.0.1;
# Template-Maintainer: Patrick Burroughs (Celti) <celti@celti.name>
_gitname="${pkgname%-git}"

arch=('any')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')
sha256sums=('SKIP')
source=("git+https://github.com/tiliado/${_gitname}.git")
url="https://github.com/tiliado/${_gitname}"

pkgver() {
	cd "${_gitname}"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${_gitname}"
	# Optimize SVG icons (scour), generate PNG icons (lasem), build and install.
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"

	# Install all available licenses.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}
# template end;
