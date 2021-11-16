# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>

pkgname=python-spacy-git
pkgver=3.2.0.r15.g86fa37e8b
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
	python-pathlib
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
	git
	python-pip
	python-wheel
	cython
)
provides=(python-spacy)
conflicts=(python-spacy)
source=('git+https://github.com/explosion/spaCy.git')
md5sums=('SKIP')

pkgver() {
	cd spaCy
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd spaCy
	python setup.py build
}

package() {
	cd spaCy
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"    
}
