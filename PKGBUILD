# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
_lang=lat-deu
pkgname=dict-freedict-${_lang}
pkgver=1.0.3
pkgrel=1
pkgdesc="Latin -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('8901f65f339a23d07dbfff86403f87599847fcf8611abfbf3feb36b7809cafef52c969a5b758ff6cf9635496d223a3d8430e5a93266fb3e73cc2f93684d12625')

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
