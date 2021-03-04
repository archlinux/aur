# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
pkgver=2.1
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
conflicts=(python-cadquery-git)
depends=(python python-ocp python-ezdxf)
checkdepends=(python-pytest python-typing_extensions)
source=("https://github.com/CadQuery/cadquery/archive/${pkgver}.tar.gz")
sha256sums=('574e3674a6f97fb4ae3849e7453bbb341e14c8675642aa1887b30b177b5c7133')

build() {
  cd cadquery-${pkgver}
  python setup.py build
}

check() {
  cd cadquery-${pkgver}
  pytest -v
}

package() {
  cd cadquery-${pkgver}
  python setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1 --skip-build

  # don't package test dir
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  rm -rf "${_i_dir}/tests"
}
