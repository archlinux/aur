# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-alignments
pkgname=python-${_pkgname}
pkgver=0.8.6
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
b2sums=("fec966468f297babc72ce433462557828bce2ba32980807c0509b4210acf1d4b80a8fe67a0c2f0e9d3955f4e56d0b0bc281cb1814dbeaf094bffe5e87e96c6e6")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
