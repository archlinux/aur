# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathy
pkgname=python-${_pkgname}
pkgver=0.14.2
pkgrel=2
pkgdesc="Logging utilities for spaCy"
arch=(any)
url="https://github.com/justindujardin/pathy"
license=("Apache-2.0")
depends=(python-smart_open python-typer python-pathlib-abc)
makedepends=(
    python-build
    python-hatchling
    python-installer
    python-setuptools
    python-wheel
)
source=("https://github.com/justindujardin/${_pkgname}/archive/refs/tags/v${pkgver}.zip")
b2sums=("33444e4d2ffa3098d9e9e0df693a5568f5ae0559ceee949327fd189ce198826b7e894b47995c7f077674fd5ad1d779f1332309c9773d710e696da3fdc24cf2ab")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
