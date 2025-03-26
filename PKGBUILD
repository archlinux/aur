# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=pathlib-abc
pkgname=python-${_pkgname}
pkgver=0.4.1
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
b2sums=("04984864de36a57180d81cca40b09653a5a3013c4efe82ea77127120fe66a3b17fc2141ed3e89aa9d7fbda57a275710463524635d20dc6ba6118d7a6c4b21df6")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LIE"
}
