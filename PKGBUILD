# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info>
_lang=eng-fra
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="English -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('51e2f5734249bf519e3f5efa265fa809708c903fdc299d80d36f5b1c088f8f144c6d47e6fcb3265570e11a93eb45c378085b116a11e2209d21e93c8942762414')

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
