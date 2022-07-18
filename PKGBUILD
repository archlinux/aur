# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname=spacy
pkgname=python-${_pkgname}
pkgver=3.4.0
pkgrel=1
pkgdesc='Free open-source library for Natural Language Processing in Python'
arch=(x86_64 aarch64)
url='https://spacy.io/'
license=(MIT)
depends=(
	python-catalogue
	python-cymem
	python-jinja
	python-langcodes
	python-murmurhash
	python-numpy
	python-plac
	python-preshed
	python-regex
	python-requests
	python-srsly
	python-thinc
	python-tqdm
	python-typer
	python-ujson
	python-wasabi
)
makedepends=(
	python-build
	python-installer
	python-wheel
	cython
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('9b4b9e42767a7054a3dbd22c3824752cd1fddec3f432890a7ab659a7999ce1db6833c001352c1d65184ffc496347844c5dd7cc5fc019c2ad15919a0c6c04859e')

build() {
	cd "spacy-${pkgver}"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "spacy-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
