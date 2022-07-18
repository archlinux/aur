# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=thinc
pkgname=python-${_pkgname}
pkgver=8.1.0
pkgrel=1
pkgdesc='Practical Machine Learning for NLP'
arch=(x86_64 aarch64)
url='https://github.com/explosion/thinc'
license=(MIT)
depends=(
	python-blis
	python-catalogue
	python-cymem
	python-hypothesis
	python-mock
	python-murmurhash
	python-numpy
	python-plac
	python-preshed
	python-pydantic
	python-six
	python-srsly
	python-tqdm
	python-wasabi
)
makedepends=(
	python-build
	python-installer
	python-wheel
	cython
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('a816b977a1ae6ec1bd69c6bf4f23f1aad8767b1947daf0f402af593607b6b37c586f487149aa3ee110b214d31d093387806698b5e2dfd1bc828c2adf25e73d96')

build() {
	cd "thinc-${pkgver}"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "thinc-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}

check() {
	cd "thinc-${pkgver}"
	# python -m pytest
}
