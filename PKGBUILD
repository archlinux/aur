# %Id
# Contributor: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=sozi-git
pkgver=12.09.a.r605
pkgrel=1
pkgdesc="An Inkscape extension that creates SVG-based presentations, using JavaScript"
arch=("any")
url="http://sozi.baierouge.fr/"
license=('GPL3' 'MIT')
depends=('python2' 'inkscape' 'pygtk' 'python2-lxml')
makedepends=('git' 'scons')
provides=("sozi")
conflicts=("sozi")
source=("Sozi::git+http://github.com/senshu/Sozi")
md5sums=("SKIP")
_lang="de es fr it nl nn pt_BR sv"

pkgver(){
	cd "Sozi"
	echo "$(git describe --always --abbrev=0 | sed 's/-/./g' ).r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

build() {
	cd "${srcdir}/Sozi"
	scons pot-update
	scons
}

package() {
	cd "${srcdir}/Sozi"

	scons --prefix="${pkgdir}/usr" DESTDIR="${pkgdir}/usr" install-editor-inkscape install-player install-docs

	sed -i  -e "s@\#\!/usr/bin/env python[2]*@\#\!/usr/bin/env python2@g" ${pkgdir}/usr/share/inkscape/extensions/sozi*.py
}

# vim:set ts=2 sw=2 et:
