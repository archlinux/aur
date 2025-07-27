# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathlib-abc
pkgname=python-${_pkgname}
pkgver=0.5.0
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
b2sums=("5fb5a049fad58eaef18f83a1d04af00fc7769026ca04cb109ba7237a04e3ceb91ad347f8a0798b4ac66bdcae2426cc82e3f64d7775ed3bada3e5fdca8686e0b5")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LIE"
}
