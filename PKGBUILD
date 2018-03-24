# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=openclonk-music
pkgver=8.1
pkgrel=1
pkgdesc="Proprietary music addon package for openclonk"
arch=('any')
url="http://www.openclonk.org/"
license=('custom:proprietary')
depends=('openclonk')
_filename='Music.ocg'
source=("http://www.openclonk.org/download/$_filename")
noextract=("$_filename")
sha256sums=('3327baa65d5e4a0110fef38b7c3b1d1c38e9da58dbddeb86281afbb37ebed96e')

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
