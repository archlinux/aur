# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=openclonk-music
pkgver=7.0
pkgrel=2
pkgdesc="Proprietary music addon package for openclonk"
arch=('any')
url="http://www.openclonk.org/"
license=('custom:proprietary')
depends=('openclonk')
_filename='Music.ocg'
source=("http://www.openclonk.org/download/$_filename")
noextract=("$_filename")
sha256sums=('d809790c0f75d8eddae0f4f98c58bb389e975ad5695d8a9eaa79a693d38b0988')

prepare() {
	c4group "$_filename" -u
}

build() {
	cd "$_filename"
	# Remove music included in the original distribution.
	rm -f $(pacman -Ql openclonk | sed -n 's#.*Music.ocg/\(.*\.ogg\)$#\1#p')
}

package() {
	cd "$_filename"
	install -Dm644 *.ogg -t "$pkgdir/usr/share/openclonk/Music.ocg"
	install -Dm644 License.txt "$pkgdir/usr/share/licenses/openclonk-music/LICENSE"
}
