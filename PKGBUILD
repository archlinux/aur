# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-spa
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=1
pkgdesc="English -> Spanish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('1ccf9b4aa09a826a4a56830fcf416b00250e2919ec6e0ce83e3fafb17e21e94e3a7e262699e6616287cef6f25c1c18994efd663fd0ae46bca5bec405fd769d2a')

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
