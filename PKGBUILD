# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_pkgname=freedict-tools
pkgname=${_pkgname}-svn
epoch=1
pkgver=r358
pkgrel=1
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="https://freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
depends=('make' 'libxslt' 'tar' 'gzip' 'dictd' 'perl' 'espeak-ng'
         'python>3.4' 'perl-xml-libxml' 'perl-xml-libxslt' 'iso-codes'
         'which')
makedepends=('subversion')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("svn+https://github.com/freedict/tools/trunk")
sha512sums=('SKIP')

pkgver()
{
	cd trunk
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}

package()
{
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
	cp -r trunk/. "${pkgdir}/usr/lib/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	ln -s /usr/lib/${_pkgname}/README.md \
		"${pkgdir}/usr/share/doc/freedict/tools/"
}
