# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-spa
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=3
pkgdesc="English -> Spanish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('9b853d260d9002338b4654562c7f111019d1d8f1f628ec1b2f19ea18b0501af90081c3e9ccaf38446d8987255408bb9cf3f42bcd1a1dcff84763c4004f520eb0')

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
