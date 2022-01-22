# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
_pkgname="${pkgname%%-*}"
pkgver=2.0.1.r73.g67dfacd
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux, git version"
url="https://github.com/puddletag/${_pkgname}"
license=('GPL3')
arch=('any')
depends=('python-configobj'
		 'python-lxml'
		 'python-mutagen'
		 'python-pillow'
		 'python-pyparsing'
		 'python-pyqt5'
		 'qt5-svg')
makedepends=('git')
optdepends=('chromaprint: AcoustID support' 
			'quodlibet: QuodLibet library support')
provides=('puddletag')
conflicts=('puddletag')
replaces=('puddletag-qt5-git')
source=("${pkgname}::git+https://github.com/${_pkgname}/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}/source"
	python setup.py config
}

package() {
	cd "${pkgname}/source"
	python setup.py install --root="${pkgdir}" --optimize=1
}
