# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathy
pkgname=python-${_pkgname}
pkgver=0.11.0
pkgrel=1
pkgdesc="Logging utilities for spaCy"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-loggers"
license=("Apache-2.0")
depends=(python-smart_open python-typer python-pathlib-abc)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("https://github.com/justindujardin/${_pkgname}/archive/refs/tags/v${pkgver}.zip")
b2sums=("351148e99829268ed20663259425155846bc2bef9f6a0b6b893f9a5b276e1c77740ac5302d7fbb6fc594d3cea601aee99f5d97f90c1ad4fbc505d17ebfc65ec7")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
