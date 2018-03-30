# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info>
_lang=fra-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.4
pkgrel=1
pkgdesc="French -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('3125eb6e2a2ce1fe327a8263a21b8567c804e0511f73bac8adf9d9ce4c5c18a82477bb0ce95105aea399b266276b03077da337d834be326cfc5c9d0dff0bc2ca')

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
