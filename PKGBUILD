# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathy
pkgname=python-${_pkgname}
pkgver=0.10.2
pkgrel=1
pkgdesc="Logging utilities for spaCy"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-loggers"
license=("Apache-2.0")
depends=(python-smart-open python-typer)
makedepends=(
    python-build
    python-setuptools
    python-wheel
)
source=("https://github.com/justindujardin/${_pkgname}/archive/refs/tags/v${pkgver}.zip")
b2sums=("864b3937585debbb9e0964c4f3e44089c0cecbfb55fa2a29ab192412e3bef10dce2a5cd647ebe6ebe5ae9991fe4ca6916de46f2950cf84fbff6d7b6b9abcb13f")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
