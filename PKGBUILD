# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=ttf-golos
pkgname=(ttf-golos-text ttf-golos-ui ttf-golos-ui-variable ttf-golos-text-variable)
pkgver=2.000
pkgrel=6
url=https://www.paratype.com/fonts/pt/golos-ui
license=(custom:OFL)
arch=(any)
source=("${pkgname}-${pkgver}.zip::https://api.paratype.com/api/editions/ofl/download/66963" b2sums)

# Silly server seems to generate a new .zip file each time,
# so manually check the contents instead.
b2sums=('SKIP'
        '17aa3d35590a1619a3922e213c54e71f311f07fd54e6fbe4f100b4c38063ecfa7877af0cb8f193aa40d75cd99f6879a6d3ea8e6cb7cb35fd3eee463d5031d87a')

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
