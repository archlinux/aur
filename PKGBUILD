# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-transformers
pkgname=python-${_pkgname}
pkgver=2.0.3
pkgrel=1
pkgdesc="Use pretrained transformers like BERT, XLNet and GPT-2 in spaCy"
arch=(x86_64 aarch64)
url='https://github.com/explosion/spacy-transformers'
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
sha256sums=("15aba60c0a0000173513fc2bbc4df449fdd421694f16fb093357235f216ff6c2")

build() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
