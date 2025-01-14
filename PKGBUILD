# Maintainer: Ryan Farley <ryan.farley@gmx.com>

_pkgname=jmk-x11-fonts
pkgname='jmk-x11-fonts-otb'
pkgdesc="Jim's Fonts for X (OTB conversion)"
pkgver='3.0'
pkgrel='4'
license=('GPL')
url='http://nikolas.us.to/jmkfonts/'
arch=('any')
conflicts=('jmk-x11-fonts')
provides=('jmk-x11-fonts')
replaces=('jmk-x11-fonts')
source=("${url}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7a99689be59eaf50742932ce27c8b41a99d10076adf9c2990e11745a873eec610257d50e844f8380658d340cf821724d459dc9b6b189666180596f2bf255957f')
makedepends=('xorg-fonttosfnt' 'xorg-mkfontscale')

build () {
	cd "${_pkgname}-${pkgver}"
	for f in *.bdf; do
		fonttosfnt -o "${f/bdf/otb}" "$f"
	done
}

package () {
	cd "${_pkgname}-${pkgver}"

	install -d "$pkgdir/usr/share/fonts/jmk"

	install -m 0444 *.otb "$pkgdir/usr/share/fonts/jmk/"
	mkfontscale "$pkgdir/usr/share/fonts/jmk/fonts.scale"
	mkfontdir "$pkgdir/usr/share/fonts/jmk/fonts.dir"
	install -m 0444 fonts.alias "$pkgdir/usr/share/fonts/jmk/fonts.alias"
}
