# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=ttf-georgewilliams
pkgver=1.0
pkgrel=4
pkgdesc='Free unicode TrueType fonts by George Williams: Caliban, Caslon Roman, Cupola'
arch=('any')
license=('BSD' 'OFL')
url='https://fontforge.org/archive/sfds/'
makedepends=('fontforge')
source=(https://fontforge.org/archive/sfds/Caliban.sfd.gz
	https://fontforge.org/archive/sfds/CaslonRoman.sfd.gz
	https://fontforge.org/archive/sfds/CaslonItalic.sfd.gz
	https://fontforge.org/archive/sfds/CaslonBold.sfd.gz
	https://fontforge.org/archive/sfds/Caslon-Black.sfd.gz
	https://fontforge.org/archive/sfds/Cupola.sfd.gz)
md5sums=('7941b977b89f7cc00d78f509002a63e2'
         '9116b8a19f2448d01a1759c862b537aa'
         '57894bf9f2d779845a0283dec7b5c745'
         '2ad1197e29dcbb78c46da9bd18f75d98'
         'aef29c573464181a2bc0ad0f86570de4'
         '692e3111ede29197e559f0fe73736606')

build() {
	for i in Caliban Caslon{Roman,Italic,Bold,-Black} Cupola; do
		fontforge -quiet -lang=ff -c 'Open($1); Generate($2)' $i.sfd $i.ttf
	done
}

package() {
	install -dm755 "$pkgdir"/usr/share/fonts/TTF
	install -m644 {Caliban,Caslon{Roman,Italic,Bold,-Black},Cupola}.ttf \
		"$pkgdir"/usr/share/fonts/TTF/

	# Author don't provide license text (or I didn't find it)
}
