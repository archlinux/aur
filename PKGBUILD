# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=spa-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=1
pkgdesc="Spanish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('8a1851e56bc188bab765aee00aa089bff268dbdd742f3c5037b174849d64332fe8efea39c865191e0b4522deabee44b42f9a15a76f24dded39659183342045e5')

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
