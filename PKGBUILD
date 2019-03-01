# Maintainer: physkets <physkets // at // tutanota dot com>
_pkgname=lammpsdoc
pkgname=${_pkgname}-git
pkgver=r181.de814fd
pkgrel=1
pkgdesc="Utilities for converting LAMMPS txt docs to Sphinx ReStructuredText"
url="https://github.com/rbberger/lammps-doc-utils"
arch=('any')
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-nose')
provides=('lammpsdoc')
conflicts=('lammpsdoc')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  python setup.py build
}

check() {
  cd ${_pkgname}
  nosetests
}

package() {
  cd ${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
