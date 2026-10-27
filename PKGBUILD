# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-alignments
pkgname=python-${_pkgname}
pkgver=0.9.4
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/${_pkgname}/archive/refs/tags/release-v${pkgver}.zip")
b2sums=("0fd8c21ef65746fb11033f7a7a1c3a1af95c0b2b6e57f65309ce8eac3a41982b74e69f0643f7bd359554a9cd8aa0c8415ae9e32edd1a8dd1e89fa0406d414703")

build() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
