# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=fra-eng
pkgname=dict-freedict-${_lang}
pkgver=0.4
pkgrel=1
pkgdesc="French -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('c7a326535a9ed23066ef46e5f741ed884f7bac53288e54a374e446536b0f25c1f4569912e1fa0f2874b179cf73ccd2d22ea956286fbabbbf87bb45a213508acc')

build()
{
	cd $_lang
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/build/dictd/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
