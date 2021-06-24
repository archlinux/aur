# Maintainer : Mustafa Ibrahim <h9s@tutanota.com>
# Modified PKGBUILD from dict-freedict-eng-deu
# <https://aur.archlinux.org/packages/dict-freedict-eng-deu/>

_lang=ara-eng
pkgname=dict-freedict-${_lang}
pkgver=0.6.3
pkgrel=1
pkgdesc="English -> Arabic dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('d911846859d6a6a92f2e04f0f255951ae22f3ad1f14e5dfa42c9267236b93c6e1135b02809491bd9772d8d47d76b512ae52425c266c0cc4fbb958eed06fb4995')

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
