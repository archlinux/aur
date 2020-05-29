# Maintainer: Gabriel Guldner <gabriel at guldner . eu>
_lang=swe-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2020.02.08
pkgrel=1
pkgdesc="Swedish -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('CCPL:by-sa' 'FDL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha256sums=(d05c37cda7c0ab4245e1ef28d83bebe9e8a9c23daea67cf7f3df54ae82bacbb2)

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
