# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=fra-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2018_06_06
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('4ad6b94e5057c56cd23b6ed4ced1d1ef014e1db2ec94eea6f8a4b8a31542c96d30ce67cc65b09b59e039835b7eb68ce1872cf39b8621f168f2d827ffc9921e6e')

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
