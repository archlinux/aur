# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts-powerline
pkgver=1.0
pkgrel=3
pkgdesc="Bedstead is a family of outline fonts based on the characters produced by the Mullard SAA5050 series of Teletext Character Generators. Patched for powerline"
url="https://bjh21.me.uk/bedstead/"
arch=(any)
license=(custom)
makedepends=('python>=3.0.0'
         'fontforge')
source=("patcher::git+https://github.com/powerline/fontpatcher"
    "https://bjh21.me.uk/bedstead/bedstead.otf"
	"https://bjh21.me.uk/bedstead/bedstead-extended.otf"
	"https://bjh21.me.uk/bedstead/bedstead-semicondensed.otf"
	"https://bjh21.me.uk/bedstead/bedstead-ultracondensed.otf")

build() {
	sed -i 's/python2/python3/g' $srcdir/patcher/scripts/powerline-fontpatcher
	cd $srcdir
	for font in ${srcdir}/*.otf
	do
	    ./patcher/scripts/powerline-fontpatcher $font
	done
}

package() {
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *Powerline.otf
}

md5sums=('SKIP'
         '15ca003818995bc4a9644bb294fc1733'
         '26da580e65466c7d584365826587241d'
         '112d481df0467030723ade2b08ea8e0b'
         'eca3e19a6b193adb49c9b553aac0fd64')
