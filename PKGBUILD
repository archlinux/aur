# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_pkgname=freedict-tools
pkgname=${_pkgname}-svn
epoch=1
pkgver=r141
pkgrel=1
pkgdesc="Tools to compile the Freedict dictionaries"
arch=('any')
url="http://www.freedict.org/"
license=('GPL' 'GPL3' 'CC-BY-SA')
makedepends=('subversion')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("svn+https://github.com/freedict/tools/trunk"
        "https://raw.githubusercontent.com/freedict/fd-dictionaries/master/README.md")
md5sums=('SKIP' 'SKIP')

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

	mkdir -p "${pkgdir}/usr/share/doc/freedict"
	cp README.md "${pkgdir}/usr/share/doc/freedict/"

	mkdir -p "${pkgdir}/usr/share/doc/freedict/tools"
	cp trunk/README.md "${pkgdir}/usr/share/doc/freedict/tools/"
}
