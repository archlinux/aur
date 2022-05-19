# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts-powerline
pkgver=1.0
pkgrel=5
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
sha256sums=('SKIP'
            '414aa3746e629d4efe17fe4c6400cf109214e082e51f8254c70e9d070e21f56d'
            'a3a21dfbe3338b2fa4b31b2dd65dd8ff4c54bd94811b7c79fe799fb43870371f'
            '01a2f3d4956f4a36bc5fa636fc6595a636007565fabb9705341ed05123f0597e'
            '236cd7c7a28a6776d9a2e0873527f41d21fd576a83b81bca4a757a87110b932e')
