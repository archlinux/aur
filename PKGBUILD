pkgname=python-pyfmi
pkgver=2.22.0
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
sha256sums=('fc4fb27e62364a7a2e9acbb93176f2e23d29f706b85247d887738862e5ad0c1f')

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
