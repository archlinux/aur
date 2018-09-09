# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: akane <grangerspit@gmail.com> <xmpp:heiß@neko.im>
_lang=eng-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3.7
pkgrel=3
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('f9ef86ff9dd82ffaa5c7c412f3bd75d8d28346dbd7c20c6772b55a45b1873724a34a826fd4b2f40dcc78b3679b15447595fe6d5f559a6b199fe553497bbd0d1a')

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
