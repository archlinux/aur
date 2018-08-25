# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: Benjamin Vanderford <hazor_at_swrpg_dot_info>
_lang=fra-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="French -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('81d8c1fbef03e441275f90c00fba3e6e08fc70f86da1ad4af352760591e4a124d1e2da00dbcc2349c693b205f6d637b92cf1cb56be132e1a25428579080fe485')

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
