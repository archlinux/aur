# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info>
_lang=eng-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=3
pkgdesc="English -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('962897981694d1990cb8c18a8411b892bd9bb96b783174529c88d871c4221696637d72bb55f89906bf780ca3853995b7ea62af5a3eecd63d5fba2006c4c6547f')

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
