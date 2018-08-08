# Maintainer: Samuel Walladge <samuel@swalladge.id.au>
_lang=eng-fin
pkgname=dict-freedict-${_lang}
pkgver="2018_06_06"
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="English -> Finnish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('a385319d3b99e1d91510ad695e63d2f957621b253f29e3132a66d6102f3da1b7d46cd255e07ad433aafd3bc64a39876a3b1e33a2e1c1b1838f836f63659834fd')

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

