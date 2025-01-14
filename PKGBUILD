# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=qics
pkgname="python-${_name}"
pkgver=1.1.2
pkgrel=1
pkgdesc='The quantum information conic solver'
arch=(any)
url='https://qics.readthedocs.io'
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/kerry-he/qics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa2730d44a42818a3d3d34690a64bc8e68ae79da3020233e1835dbc9809944dc')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    pytest --doctest-modules
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
