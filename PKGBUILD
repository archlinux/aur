# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.1.6
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
b2sums=("c8a6a21ca3e7a0171d4520cb4a66763cfc86eb1c818f04f794323604e9417a5016398be512e76ced2792e293304c1864845b1a5c807f6f3b38e088c6148c6f8b")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
