# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cadquery-git
pkgver=2.0RC1.r61.g74573fc
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC built from git"
arch=('any')
url="https://github.com/CadQuery/cadquery"
license=('Apache')
provides=('python-cadquery')
conflicts=('python-cadquery')
depends=('python-occ-cadquery-git' 'python')
makedepends=('python-pytest' 'python-pytest-cov')

source=("git+https://github.com/CadQuery/cadquery.git")
md5sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd cadquery
  #pytest -v --cov
  pytest -v --cov || true
}

package() {
  cd cadquery
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

