# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
_pkgname="${pkgname%%-*}"
pkgver=2.1.1.r138.ge9d16b9
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
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('chromaprint: AcoustID support' 
            'quodlibet: QuodLibet library support')
provides=('puddletag')
conflicts=('puddletag')
replaces=('puddletag-qt5-git')
source=("${pkgname}::git+https://github.com/${_pkgname}/${_pkgname}")
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
