# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2018.09.13
pkgrel=3
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('CCPL:by-sa' 'FDL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('2fdebd17c5257c5dd6364983da80ba7e93f08997481a09d94b001465d3f0145aa166b6cbdef96ee4a75226602fcbfeee43e16b4d34d7c1f00e762da569f810b3')

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
