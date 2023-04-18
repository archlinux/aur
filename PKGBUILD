# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.2.3
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
        python-huggingface-hub
)
makedepends=(
	python-pip
	python-wheel
	python-setuptools
)
source=("https://github.com/explosion/${_pkgname}/archive/refs/tags/v${pkgver}.zip")
b2sums=("884a184e04add20500e156c5802dace4cf97dfe24ab3c619f02765b447a95ac465220b8d6af25d66ee084877be9b5e0b2d450fb2246f407630ff0b9339b641a1")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
