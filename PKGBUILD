# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-fra
pkgname=dict-freedict-${_lang}
pkgver=0.1.6
pkgrel=1
pkgdesc="English -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('3ab092e1e5ded48e4bc066c0a8bb221c17904cdc0c30ead4f4b09c6b49cb8af39f2384131fe54055e59c4ceba875df414b255d6b80a2e5ab83bd72b319d91391')

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
