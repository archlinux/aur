# Maintainer : Juraj Matuš <matus.juraj at yandex dot com>

_lang=slk-eng
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=1
pkgdesc="Slovak -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=install.sh
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}.${pkgrel}/freedict-${_lang}-${pkgver}.${pkgrel}.src.tar.xz")
sha512sums=('ba7669020a12f64f7d2e2b6dfa90f1376df4a2fe764273bdb06f1e04998ee6dac9584b47f20f8e14cbaae5bf7271dd221032bcc34bd1ff7c93a93cf9de4429ac')

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
