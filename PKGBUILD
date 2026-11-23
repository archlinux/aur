pkgname=python-pyfmi
pkgver=2.24.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard"
url="https://github.com/modelon-community/PyFMI"
arch=(x86_64)
license=(LGPL-3.0-only)
makedepends=(python-build python-installer python-setuptools cython)
depends=(glibc fmilib python python-numpy python-scipy python-assimulo)
optdepends=('python-matplotlib: plots')
options=(!lto)
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('bd757c79b975d100bf76a1b2171db2a48a1e80ed837280d8d0b9b14c9153d40c')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
}

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  export FMIL_HOME=/usr
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
