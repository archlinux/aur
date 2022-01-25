# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=ttf-golos
pkgname=(ttf-golos-text ttf-golos-ui ttf-golos-ui-variable ttf-golos-text-variable)
pkgver=2.000
pkgrel=4
url=https://www.paratype.com/fonts/pt/golos-ui
license=(custom:OFL)
arch=(any)
source=("${pkgname}-${pkgver}.zip::https://api.paratype.com/api/editions/ofl/download/66963" b2sums)

# Silly server seems to generate a new .zip file each time,
# so manually check the contents instead.
b2sums=('SKIP'
        '9e754e598ff9e1b8bceed8d90a17715e157196ef73bdac03fe9f0b140754ff0b0a7999687efdd9e2031f9c05b8dea068447b29854329996f096a87484ed3d247')

DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u --referer https://www.paratype.com/ --user-agent Mozilla')

prepare () {
	b2sum -c --strict b2sums
}

_package () {
	install -m644 -D "${srcdir}/${_zipdir}/OFL.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
	install -m644 -Dt "${pkgdir}/usr/share/fonts/${pkgname}" "$@"
}

package_ttf-golos-text () {
	pkgdesc='Uniwidth sans-serif font suitable for text'
	_package PT/PT/Golos-Text/Golos-Text_{Black,Bold,DemiBold,Medium,Regular}.ttf
}

package_ttf-golos-text-variable () {
	pkgdesc='Uniwidth sans-serif font suitable for text (variable version)'
	_package PT/PT/Golos-Text/Golos-Text_VF.ttf
}

package_ttf-golos-ui () {
	pkgdesc='Uniwidth sans-serif font suitable for user interfaces'
	_package PT/PT/Golos-UI/Golos-UI_{Bold,Medium,Regular}.ttf
}

package_ttf-golos-ui-variable () {
	pkgdesc='Uniwidth sans-serif font suitable for user interfaces (variable version)'
	_package PT/PT/Golos-UI/Golos-UI_VF.ttf
}
