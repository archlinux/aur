# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts-powerline
pkgver=1.0
pkgrel=2
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
         '5cab98db24ae772915a2f64b17a06e8a'
         '61bb84cf9e41872c1ceeb761e6188dbb'
         '1c6bf1981819d4fc1259cb531b661cd4'
         '61b0921351a769e629fd92d096254c00')
