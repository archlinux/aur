# $Id$
# Maintainer: Grey Christoforo <grey at christoforo dot net>

pkgname=python-cadquery
_build_hash=03c3266b8d61d487349a15f73d3b3cb13bce625f  # can't go beyond this atm because python-ocp is stuck because opencascade is out of date
pkgver=2.1.r531
pkgrel=1
pkgdesc="A parametric CAD scripting framework based on PythonOCC"
arch=(x86_64)
url="https://github.com/CadQuery/cadquery"
license=('Apache')
conflicts=(python-cadquery-git)
depends=(
python
python-ocp
python-ezdxf
python-multimethod
nlopt
casadi
python-typish
python-nptyping
)
checkdepends=(
python-pytest
python-typing_extensions
python-docutils
)
makedepends=(
git
python-setuptools-scm
python-build
python-installer
python-wheel
)
source=(git+https://github.com/CadQuery/cadquery#commit=${_build_hash})
sha256sums=('SKIP')

pkgver() {
  cd cadquery
  git describe --tags | rev | cut -d- -f2- | rev | sed 's/-/.r/'
}

build() {
  cd cadquery
  python -m build --wheel --no-isolation
}

check() {
  cd cadquery
  pytest -v
}

package() {
  cd cadquery
  python -m installer --destdir="$pkgdir" dist/*.whl
}
