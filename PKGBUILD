# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=1.3.7
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
source=("https://github.com/explosion/${_pkgname}/archive/refs/tags/release-v${pkgver}.zip")
b2sums=("03ee12c0c50218259f53036ea6c6ece26a9e4a982f8f3a981ae9449b3179524a051bd743f523772fbae06f983f07047aa77476f52e9110b71adc2299400576b8")

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
