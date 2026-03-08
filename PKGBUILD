# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathy
pkgname=python-${_pkgname}
pkgver=0.14.0
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
b2sums=("b89563983836c8aac7950942110c78031f64c65784de983663a937bc076bfd1b0db7e4c0b05d32f685bf0ecfaeaf578aae44a4f7718e77780fbcaebad76fac90")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
