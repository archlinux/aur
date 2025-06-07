# Maintainer: Standa Lukeš <archpkg@exyi.cz>
_pyname="pybind11-stubgen"
pkgname="python-${_pyname}"
pkgver=2.5.4
pkgrel=1
pkgdesc="PEP 561 type stubs generator for pybind11 modules"
arch=(x86_64)
url="https://github.com/sizmailov/pybind11-stubgen"
license=('BSD-3-Clause')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python)
checkdepends=()
#source=("${_pyname}-${pkgver}.tgz::https://github.com/sizmailov/pybind11-stubgen/archive/v${pkgver}.tar.gz")
# The build complains about "listing git files failed - pretending there aren't any", so we clone the git repo
source=("${_pyname}-${pkgver}::git+https://github.com/sizmailov/pybind11-stubgen.git#tag=v${pkgver}")
sha256sums=('5448e72da3e78424c9e1d1e81c8540ff7f0487d42150ffc7c5c5bdc024f638a6')

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
