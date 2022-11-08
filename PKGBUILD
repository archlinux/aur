# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
pkgver=2.1.r531.g03c3266
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
conflicts=(python-cadquery-git)
depends=(
python
'python-ocp=>7.6.3'
python-ezdxf
)
checkdepends=(
python-pytest
python-typing_extensions
)
source=(git+https://github.com/CadQuery/cadquery#commit=03c3266b8d61d487349a15f73d3b3cb13bce625f)
sha256sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
  cd cadquery
  python setup.py build
}

check() {
  cd cadquery
  pytest -v
}

package() {
  cd cadquery
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}
