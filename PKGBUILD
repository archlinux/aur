# Maintainer: Willem Mulder <14mRh4X0r+aur@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_name=traces
pkgname=python-traces
pkgver=0.6.4
pkgrel=1
pkgdesc="Python library for unevenly-spaced time series analysis"
url="https://pypi.org/project/${_name}/"
depends=(python-sortedcontainers)
makedepends=(python-build python-installer python-wheel python-poetry-core)
optdepends=(
    'python-pandas: sample_interval support'
    'python-matplotlib: plot support'
)
license=(MIT)
arch=(any)
source=("${_name}-${pkgver}.tar.gz::https://github.com/stringertheory/traces/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0ad4f6f6267a4a2b96488b987663bae758be401c47273846e6bff11def4af0be')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
