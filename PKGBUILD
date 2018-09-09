# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=spa-eng
pkgname=dict-freedict-${_lang}
pkgver=0.3
pkgrel=3
pkgdesc="Spanish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('c119d1450d9eb78588685fc505d56bceeac20ed6fdde3ee6fe1ce0c2d6fddc3ad500edf3ef5a9f9149ed1f3564c1b1283ab31be198ead6f9f1e8d19da5d1d8fa')

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
