# Maintainer: Johann Rohwer <j.m.rohwer at gmail dot com>

_lang=afr-deu
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-bin
pkgver=0.3.3
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Afrikaans -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.dictd.tar.xz")
sha512sums=('92ff63876ec42d1c4ba090e43e93c9274827de9b466273e56198f26d010367a67b277b643549da2861773660eed71af00496e773d280d65f451b6118ec820e36')

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
	# License
	install -m 644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}/" ${_lang}/COPYING
}
    
