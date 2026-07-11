# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname=jsonpath-python
pkgname="python-${_pkgname}"
pkgver=1.1.6
pkgrel=2
pkgdesc="A more powerful JSONPath implementation in modern python"
arch=("any")
url="https://github.com/sean2077/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=(
    "python-build"
    "python-installer"
    "python-hatchling"
)
checkdepends=(
    "uv"
    "python-pytest"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('9e0ae4577526317249c34f7ed9ac27a710c4bdf927798e249bcba3e2ce6e9d04')

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}"
    uv sync --extra dev
    uv run python -m pytest
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
