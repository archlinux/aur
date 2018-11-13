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
sha512sums=('0fd1ac3cb2839c0e650de4f43cd8156679a240f7651a37b52946fdde93f97e40e530e3a7e7b26874dcd4593834e6e340aed156fdedb1c4a5f646f68d5b1ebc0d')

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
