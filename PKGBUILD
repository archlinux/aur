# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
pkgver=2.0.1.r63.g863d4f5
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux, git version"
url="https://github.com/puddletag/puddletag"
license=('GPL3')
arch=('any')
depends=('python-mutagen' 
	 'python-pyparsing' 
	 'python-configobj' 
	 'python-pyqt5' 
	 'qt5-svg' 
	 'python-pillow')
makedepends=('git')
optdepends=('chromaprint: AcoustID support' 
	    'quodlibet: QuodLibet library support')
provides=('puddletag')
conflicts=('puddletag')
replaces=('puddletag-qt5-git')
source=("${pkgname}::git+https://github.com/puddletag/puddletag")
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
