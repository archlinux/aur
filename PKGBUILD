# Maintainer: Lukas Werling <lukas.werling@gmail.com>
pkgname=openclonk-music
pkgver=7.0
pkgrel=1
pkgdesc="Proprietary music addon package for openclonk"
arch=('any')
url="http://www.openclonk.org/"
license=('custom:proprietary')
depends=('openclonk')
_filename='Music.ocg'
source=("http://www.openclonk.org/download/$_filename")
noextract=("$_filename")
sha256sums=('affac5cc0bdcb40148b5f6e8c8b2a83486c0713387fe8e9630fac3eebc89147a')

prepare() {
	c4group "$_filename" -u
}

build() {
	cd "$_filename"
	# Remove music included in the original distribution.
	rm $(pacman -Ql openclonk | sed -n 's#.*Music.ocg/\(.*\.ogg\)$#\1#p')
}

package() {
	cd "$_filename"
	install -Dm644 *.ogg -t "$pkgdir/usr/share/openclonk/Music.ocg"
	install -Dm644 License.txt "$pkgdir/usr/share/licenses/openclonk-music/LICENSE"
}
