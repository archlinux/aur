# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
pkgver=2.2.0.r10.gff36a9b
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux, git version"
url="https://github.com/${pkgname%%-*}/${pkgname%%-*}"
license=('GPL3')
arch=('any')
depends=('python-configobj'
         'python-mutagen'
         'python-pyparsing'
         'python-pyqt5'
         'qt5-svg')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('chromaprint: AcoustID support'
            'python-levenshtein: faster duplicate matching'
            'python-lxml: additional tag sources' 
            'quodlibet: QuodLibet library support')
provides=("${pkgname%%-*}")
conflicts=("${pkgname%%-*}")
replaces=("${pkgname%%-*}-qt5-git")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
