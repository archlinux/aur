# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: akane <grangerspit@gmail.com> <xmpp:heiß@neko.im>
_lang=eng-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="English -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://sourceforge.net/projects/freedict/files/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('6f9ecf9d4e11e22d7e4284e21231f358fe03cb782f53866ba1b1a4f7ec4c89fb6024c05421d2daf8d3c7c7e215d356d67f2f9da33b907820a5260c512d15bd51')

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
