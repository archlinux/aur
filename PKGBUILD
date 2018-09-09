# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=fra-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=2018_06_06
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('c744006dcfea771209219ab49caf3e5add68ef5b5383b46eadccb9ce7e0293cb67466e53e852a34a1b46c78104631963face027b22f97db725b5837232792a3e')

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
