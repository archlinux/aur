# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.1.8
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
b2sums=("f04a0607bb1fe69aba4af0381e1abd665f11f4afcdeec5abf6694389b64bf5b3e5ab95d6275066bbe179aafed36062e42e9f789c2d85868993c9332b0864fe91")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
