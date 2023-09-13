# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-loggers
pkgname=python-${_pkgname}
pkgver=1.0.5
pkgrel=1
pkgdesc="Logging utilities for spaCy"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-loggers"
license=(MIT)
depends=(python)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=(
    "https://github.com/explosion/${_pkgname}/archive/refs/tags/v${pkgver}.zip"
)
b2sums=("ab9268f712092ff18355a2068031efaa153dcf41e34c0b4452aae982a30788616cbf577fccffd6cf03ddc881f4c2dd7ad0b2bdb482e22995f6a76a7fd15de811")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
