# Maintainer : Mustafa Ibrahim <h9s@tutanota.com>
# Modified PKGBUILD from dict-freedict-eng-deu
# <https://aur.archlinux.org/packages/dict-freedict-eng-deu/>

_lang=eng-ara
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
sha512sums=('2604f6ce902e719c61fcf391bef02cdbf5eb60f5acd4f601b243933081689c0cfc4e169400f84bdda95a77110d545ddba444739d9d05b6d5d2a12b7aeab1bbd1')

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
