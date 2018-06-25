# Maintainer: Bart De Roy <de dot roy dot bart at gmail dot com>
_lang=nld-eng
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=1
pkgdesc="Dutch -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('036ca95790159f8cd7e7a42ec799dd686481e74024716ee34cefa1f7d04ab06968ab18b1de4482bca83f06a36378bf36f3f7fff4a2272417f29a9eb1d10ce872')

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
