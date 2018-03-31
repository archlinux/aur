# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-eng
pkgname=dict-freedict-${_lang}
pkgver=0.3.5
pkgrel=1
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('035ed0306b28394b083c5074775598e38cce3c39842a65344b08e459982d24ef50657666a19580bb18fe32fde3a5fc39016a570277370c62c7724faea11df11c')

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
