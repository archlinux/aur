# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-alignments
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
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
b2sums=("d1e7c722a284ca465d49830674c300abd879e37182197196b5619dcb2b2aed6a1ce810ac1fcb38f77805454e6d3b82ac03f17a283a313e2404a2ff5b4e64099f")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
