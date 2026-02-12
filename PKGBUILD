# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>
# Contributor: eshrh <esrh at gatech dot edu>

pkgname=mpv-mpvacious
pkgver=26.2.12.0
pkgrel=1
pkgdesc="Adds mpv keybindings to create Anki cards from movies and TV shows."
arch=('any')
url="https://github.com/Ajatt-Tools/mpvacious"
license=('GPL3')
depends=('mpv>=0.41' 'curl')
makedepends=('make')
optdepends=(
	'xclip: clipboard autocopy'
	'wl-clipboard: clipboard autocopy on wayland'
	'ffmpeg: using ffmpeg directly to encode media'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9e70c7e03902030865b66c64103cb528c07b4aca11b104a77537c0efa747bfaed630a7424834ba0034923e966c5c2340de8d6b60121a51564c7b56b4549a71f8')
install="${pkgname#mpv-}.install"

package() {
	cd -- "$srcdir/${pkgname#mpv-}-${pkgver}"
	make PREFIX="${pkgdir}/etc/mpv/" VERSION="$pkgver" install
	printf -- '{"version": "v%s"}' "$pkgver" > "${pkgdir}/etc/mpv/scripts/${pkgname#mpv-}/version.json"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
