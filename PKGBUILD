# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-swe
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=4
pkgdesc="English -> Swedish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('75206851788ea3208afb430ca69ac1224cae95d5cd69d7da528c7c388965e495838d3879eb6d632a71157e786bb4b75449c7368773d17e4caeb1046960029057')
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
