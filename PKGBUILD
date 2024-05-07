# Maintainer: Standa Lukeš <archpkg@exyi.cz>
_pyname="pybind11-stubgen"
pkgname="python-${_pyname}"
pkgver=2.5.1
pkgrel=1
pkgdesc="PEP 561 type stubs generator for pybind11 modules"
arch=(x86_64)
url="https://github.com/sizmailov/pybind11-stubgen"
license=('BSD')
makedepends=(python-build python-installer python-wheel)
depends=(python pybind11)
checkdepends=()
#source=("${_pyname}-${pkgver}.tgz::https://github.com/sizmailov/pybind11-stubgen/archive/v${pkgver}.tar.gz")
# The build complains about "listing git files failed - pretending there aren't any", so we clone the git repo
source=("${_pyname}-${pkgver}::git+https://github.com/sizmailov/pybind11-stubgen.git#tag=v${pkgver}")
sha256sums=('f4bd01a51c8c6169cd96502425d32a449fd9039867bd9e9a3c0f2dee65f01ff9')

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
