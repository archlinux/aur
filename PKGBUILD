# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-deu
pkgname=dict-freedict-${_lang}
pkgver=0.3.7
pkgrel=1
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('671687a683eaecc23c2fc7f7d327d88989918cef25e19ef541a0828d5915d3f675927660a8c175dc6e74751de31e7abe21108ec8c9f354250d42f02336540e1f')

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
