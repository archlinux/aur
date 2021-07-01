# Maintainer: Johann Rohwer <j.m.rohwer at gmail dot com>

_lang=eng-afr
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.1.3
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="English -> Afrikaans dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('9ae4d6f3d0ae6b36ab5c0e78c3cf94f650fb2b6a6a645aab4e9f5ee8de96762c4a1329deeff46e3cdc3349979eb3310dfd5cb4a8a59fbc1740c77063ad7bb809')

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
	# License
	install -m 644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}/" ${_lang}/COPYING
}
    
