# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.3.3
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
b2sums=("af3308d8d5279911582ae6d563c2ea543f8e7ba64a26035fd89916d085f98c6f489ebf78dfbc736d464a0bfac488a0bfc996ea865e8bb70e6c17a72e6014af34")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
