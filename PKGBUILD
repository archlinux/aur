# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=spa-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=3
pkgdesc="Spanish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('f30e87c692e294d1c0da3557a497ddc3dc2104bbd7b8a636e011485b6ae13292fbbee5b71ac84e9f8507b6af031dd01aa0893c58dacbd84fb9effe7f56beac9a')

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
