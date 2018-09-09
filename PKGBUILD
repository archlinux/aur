# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-spa
pkgname=dict-freedict-${_lang}
pkgver=0.3
pkgrel=3
pkgdesc="English -> Spanish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('f0e99c8f3ae1e4d038f3b5e243ce8098057d6bab5fef0fac77fec6f93710a1a74fd1a3657bd8b7ce3408d4111a6c57a305870eba188bbcc7acd7f3e330b596b4')

build()
{
	cd $_lang
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/build/dictd/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
