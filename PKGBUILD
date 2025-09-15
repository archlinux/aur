# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.3.9
pkgrel=1
pkgdesc="spaCy pipelines for pre-trained BERT and other transformers"
arch=(x86_64 aarch64)
url='https://spacy.io/'
license=(MIT)
depends=(
	python-spacy
	python-transformers
	python-pytorch
	python-srsly
	python-spacy-alignments
    python-numpy
)
makedepends=(
    cython
	python-pip
	python-wheel
	python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/explosion/${_pkgname}/archive/refs/tags/release-v${pkgver}.tar.gz")
b2sums=("91db967e6f8269c09f5773da4e8c1c3c9b4315cf9a1123016683ad0a6912d69d39ac4b476df4835d702284cd6ca8a5c7fbd5439f33f9567dfa7d56ef8728cef0")

build() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
