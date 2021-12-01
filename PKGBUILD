# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts-powerline
pkgver=1.0
pkgrel=4
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
         '8f470fe3177d0ade14a5e464a08c365d'
         'e180a7de8a79427bf42aebf78313a1e1'
         '8a614f589a87e8c1b2bb09a53316692c'
         '9c7f71fce912257e3fa1e822e5099421')
