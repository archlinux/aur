# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>
# Contributor: eshrh <esrh at gatech dot edu>

pkgname=mpv-mpvacious
pkgver=26.2.13.0
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
sha512sums=('3b32651b32acde0a84e6e05fc5de578080ce7c1a7a063f67d4b423a7cbca230f118364d8e0bca070d2aa59a4400c23789d8b98e7dd59d2b3affbde1a4e0f299e')
install="${pkgname#mpv-}.install"

package() {
	cd -- "$srcdir/${pkgname#mpv-}-${pkgver}"
	make PREFIX="${pkgdir}/etc/mpv/" VERSION="$pkgver" install
	printf -- '{"version": "v%s"}' "$pkgver" > "${pkgdir}/etc/mpv/scripts/${pkgname#mpv-}/version.json"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
