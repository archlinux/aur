# Maintainer: Willem Mulder <14mRh4X0r+aur@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_name=traces
pkgname=python-traces
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for unevenly-spaced time series analysis"
url="https://pypi.org/project/${_name}/"
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=(
    'python-pandas: sample_interval support'
    'python-matplotlib: plot support'
)
license=(MIT)
arch=(any)
source=("${_name}-${pkgver}.tar.gz::https://github.com/stringertheory/traces/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('843c6c36313c71ff0d0519a47cf9ddb4f059e0d3dd8ab24425f3f7df71f7203e')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
