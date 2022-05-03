# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-alignments
pkgname=python-${_pkgname}
pkgver=0.8.5
pkgrel=2
pkgdesc="A spaCy package for the Rust tokenizations library"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-alignments"
license=(MIT)
depends=(python-hypothesis)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
    python-setuptools-rust
)
source=(
    "https://github.com/explosion/${_pkgname}/archive/refs/tags/v${pkgver}.zip"
)
b2sums=(
    "31acc23166cf0a805171379518fd1bc35cc8a2064599a59e64117326767f6488583f4d0d3b4aabdfa287bfcc7d752c1e3e3a619f3988bdc128e7a3f45e0080d4"
)

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
