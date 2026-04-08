# Maintainer: Rubin Simons <me@rubin55.org>

_pkgname=jsonpath-python
pkgname="python-${_pkgname}"
pkgver=1.1.5
pkgrel=1
pkgdesc="A more powerful JSONPath implementation in modern python"
arch=("any")
url="https://github.com/zhangxianbing/${_pkgname}"
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
sha256sums=('SKIP')

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
