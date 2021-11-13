# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cadquery-git
pkgver=2.1.r267.ga6cbf22
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC built from git"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
provides=(python-cadquery)
conflicts=(python-cadquery)
depends=(
python
python-multimethod
python-ocp
python-ezdxf
python-typing_extensions
nlopt
openvr
)
checkdepends=(
python-pytest
python-nptyping
ipython
)

source=("git+https://github.com/CadQuery/cadquery.git")
md5sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cadquery
}

build() {
  cd cadquery
  python setup.py build
}

check() {
  cd cadquery
  pytest
}

package() {
  cd cadquery
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}

