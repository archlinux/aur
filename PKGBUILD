# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=ttf-golos
pkgname=(ttf-golos-text ttf-golos-ui ttf-golos-ui-variable ttf-golos-text-variable)
pkgver=2.000
pkgrel=7
url=https://www.paratype.com/fonts/pt/golos-ui
license=(custom:OFL)
arch=(any)
source=("${pkgname}-${pkgver}.zip::https://api.paratype.com/api/editions/ofl/download/66963" b2sums)

# Silly server seems to generate a new .zip file each time,
# so manually check the contents instead.
b2sums=('SKIP'
        '65f46f4c96382134edd05061bebef02f8654bc3c198c6604be5bf4dead8e76687a18ff2a0d76349829e5d84b29a04eb7c045758ee75ef65eb2cc1784c1ee9d45')

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
	_package PT/PT/Golos-Text/golos-text_{black,bold,demibold,medium,regular}.ttf
}

package_ttf-golos-text-variable () {
	pkgdesc='Uniwidth sans-serif font suitable for text (variable version)'
	_package PT/PT/Golos-Text/golos-text_vf.ttf
}

package_ttf-golos-ui () {
	pkgdesc='Uniwidth sans-serif font suitable for user interfaces'
	_package PT/PT/Golos-UI/golos-ui_{bold,medium,regular}.ttf
}

package_ttf-golos-ui-variable () {
	pkgdesc='Uniwidth sans-serif font suitable for user interfaces (variable version)'
	_package PT/PT/Golos-UI/golos-ui_vf.ttf
}
