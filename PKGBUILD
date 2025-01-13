# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=qics
pkgname="python-${_name}"
pkgver=1.1.1
pkgrel=1
pkgdesc='The quantum information conic solver'
arch=(any)
url='https://qics.readthedocs.io'
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/kerry-he/qics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1c4974bed57cae94ce84928abe6fc1d426a2a3901155bbbd79b7c5803aaa0c3')

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
