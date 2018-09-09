# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
# Contributor: akane <grangerspit@gmail.com> <xmpp:heiß@neko.im>
_lang=deu-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3.5
pkgrel=3
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.dictd.tar.xz")
sha512sums=('d75b62396a29a2977513fdf94b91c2e3a9e2291f5619b6eefe1fdf1a9883c804b0337c1c4876886a1bc4fc36322bbe90bc5a731869e4e680abff53fde52a3083')

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
