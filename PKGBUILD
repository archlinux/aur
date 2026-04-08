# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname=jsonpath-python
pkgname="python-${_pkgname}"
pkgver=1.1.5
pkgrel=1
pkgdesc="A more powerful JSONPath implementation in modern python"
arch=("any")
url="https://github.com/sean2077/${_pkgname}"
license=('MIT')
depends=("python")
makedepends=(
    "python-build"
    "python-installer"
    "python-pytest"
    "python-hatchling"
    "uv"
)
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('e94d043015bbe978047bc17df46916aafae7c92d37302f0c0135239932116253')

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
