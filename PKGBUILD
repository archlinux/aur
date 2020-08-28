# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
pkgver=r973.66636fc
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}/source"
  python setup.py config
}

package() {
  cd "${pkgname}/source"
  python setup.py install --root="${pkgdir}" --optimize=1
}
