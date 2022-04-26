# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=ttf-golos
pkgname=(ttf-golos-text ttf-golos-ui ttf-golos-ui-variable ttf-golos-text-variable)
pkgver=2.000
pkgrel=5
url=https://www.paratype.com/fonts/pt/golos-ui
license=(custom:OFL)
arch=(any)
source=("${pkgname}-${pkgver}.zip::https://api.paratype.com/api/editions/ofl/download/66963" b2sums)

# Silly server seems to generate a new .zip file each time,
# so manually check the contents instead.
b2sums=('SKIP'
        '8fad5578971942fa47094bb6bcf9a8af8d40708b91be4cd0fe55120fa7c85cc636f5ff3e8114874ceb6fa3b437f3bd909bd296e587a0df099ce1e054a180b3ec')

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
