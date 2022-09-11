# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=kodi-cli-git
pkgver=r60.899075e
pkgrel=1
pkgdesc="Kodi/XBMC bash script to send Kodi commands from the command line"
arch=('any')
url="https://github.com/nawar/kodi-cli"
license=('GPL')
depends=('curl')
optdepends=(
	'mps-youtube: launch youtube video with -o switch'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git+https://github.com/nawar/kodi-cli')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m755 kodi-cli ${pkgdir}/usr/bin/kodi-cli
	install -D -m755 playlist_to_kodi ${pkgdir}/usr/bin/playlist_to_kodi
	install -D -m644 .kodirc ${pkgdir}/usr/share/doc/kodi-cli/kodirc-example
}
