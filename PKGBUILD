# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathlib-abc
pkgname=python-${_pkgname}
pkgver=0.4.0
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
b2sums=("90807920613fd6077993b8ac1f6d0c06727ad7c9dfb5396807bb2d932acc618e093555b3b88b315e988fb4e8eaa821badf54fbd5009d2a5dbd81f180269ebbc6")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LIE"
}
