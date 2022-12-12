# Maintainer: Gabriel Guldner <gabriel at guldner . eu>
_lang=deu-swe
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2022.11.18
pkgrel=1
pkgdesc="German -> Swedish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('CCPL:by-sa' 'FDL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha256sums=('515e7dd3d5ae004d34fecbf7449fbed63505401365b845858c1aed241162381a')

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
