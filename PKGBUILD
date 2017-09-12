# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=otf-montserrat-git
_pkgname=otf-montserrat
pkgver=v6.002.r0.g12461d3
pkgrel=1
pkgdesc="A typeface designed to rescue the beauty of urban typography from the first half of the twentieth century."
arch=('any')
url='https://github.com/JulietaUla/Montserrat'
license=('custom: SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=${pkgname}.install
source=('git+https://github.com/JulietaUla/Montserrat.git')
sha256sums=('SKIP')

_fontname='Montserrat'

pkgver() {
  cd "$_fontname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_fontname/fonts/otf"

	for font in ./*.otf; do
		install -Dm644 "$font" "$pkgdir/usr/share/fonts/OTF/$font"
	done

	install -Dm644 "$srcdir/$_fontname/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
