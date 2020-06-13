# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: corubba <corubba at gmx dot de>
# Contributor: Jakub Kozisek <nodevel at gmail dot com>

pkgname=puddletag-qt5-git
pkgver=r942.3c5e2dc
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux, Qt5 + Python 3 fork"
url="https://github.com/sandrotosi/puddletag"
license=('GPL3')
arch=('any')
depends=('python' 
	 'python-mutagen' 
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
source=("${pkgname}::git+https://github.com/sandrotosi/puddletag")
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
