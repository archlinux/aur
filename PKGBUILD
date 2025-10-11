# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathlib-abc
pkgname=python-${_pkgname}
pkgver=0.5.2
pkgrel=1
pkgdesc="Python base classes for rich path objects"
arch=(x86_64 aarch64)
url="https://github.com/barneygale/pathlib-abc"
license=("PSF-2.0")
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
    python-hatchling
)
source=("https://github.com/barneygale/${_pkgname}/archive/refs/tags/${pkgver}.zip")
b2sums=("13702b2355e8a5df36d23cb017ae5accede003422c182341fd6828bd6ce45170f5e7637a4049ad6bd2efaa5221f8f549fc0c62df0ef58a21a0e4f9d6b91ccbc3")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LIE"
}
