# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Einhard Leichtfuß <alguien@respiranto.de>
_lang=swe-eng
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=3
pkgdesc="Swedish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('f6333261e2b666f6cff71973444600d46c37f9f5d855bf5338cbd281aa88bebb8183c0f8534daa9571e5fab96985b5e3435b41466d132591f4b476ac2fcd3410')
changelog="ChangeLog"

prepare()
{
        cp -f ${_lang}/ChangeLog ..
}

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
