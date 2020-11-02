# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cadquery-git
pkgver=2.0.1.r174.g65f9608
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC built from git"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
provides=(python-cadquery)
conflicts=(python-cadquery)
depends=(python python-ocp python-ezdxf)
checkdepends=(python-pytest python-pytest-cov python-typing_extensions)

source=("git+https://github.com/CadQuery/cadquery.git")
md5sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd cadquery
  pytest -v --cov
}

build() {
  cd cadquery
  python setup.py build
}

package() {
  cd cadquery
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}

