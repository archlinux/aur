# Maintainer: Einhard Leichtfuß <archer@respiranto.de>
_pkgname=freedict-tools
pkgname=${_pkgname}-svn
pkgver=r1487
pkgrel=1
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="http://www.freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
makedepends=('subversion')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("svn+https://github.com/freedict/fd-dictionaries/trunk/tools"
        "svn+https://github.com/freedict/fd-dictionaries/trunk/shared"
        "https://raw.githubusercontent.com/freedict/fd-dictionaries/master/README.md")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver()
{
	cd "tools"
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
}

package()
{
	mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
	cp -r tools "${pkgdir}/usr/lib/${_pkgname}/"
	cp -r shared "${pkgdir}/usr/lib/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict"
	cp README.md "${pkgdir}/usr/share/doc/freedict/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	cp tools/README "${pkgdir}/usr/share/doc/freedict/tools/"
}
