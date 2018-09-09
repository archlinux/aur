# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=fra-deu
pkgname=dict-freedict-${_lang}
pkgver=2018_06_06
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('2445dfb5e2fd782aa07cc9409ee8a2c6dce9b3b38c889f4fef2d67be73e6077a74c2b36c7c201f9d17dd7aae5bf340a8dd2295a1de056ff518ed55179fe36529')

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
