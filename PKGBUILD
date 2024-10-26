# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tuhh de>

_name=qics
pkgname="python-${_name}"
pkgver=1.0.0
pkgrel=1
pkgdesc='The quantum information conic solver'
arch=(any)
url='https://qics.readthedocs.io'
license=(MIT)
depends=(python-numpy python-scipy python-numba)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("https://github.com/kerry-he/qics/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('962e34efd6822dcd4c77dc468ed75dcfd412544d0aede354e18ed63ceb02afc3')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    pytest
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
