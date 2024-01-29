# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathlib-abc
pkgname=python-${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="Python base classes for rich path objects"
arch=(x86_64 aarch64)
url="https://github.com/barneygale/pathlib-abc"
license=("Python Software Foundation License")
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
    python-hatchling
)
source=("https://github.com/barneygale/${_pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=("2722a24484e2bb0c63e3a671ec45d4fbb532e578cb6995cc6c99288fb6fff138a983561e6a1b70c62ad9921e2647b0f88d2fe774c48f1cfb54c3337b73af06e0")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LIE"
}
