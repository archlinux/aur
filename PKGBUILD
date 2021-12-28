# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>

pkgname=python-thinc-git
pkgver=8.0.14.dev0.r2.g7b54f728
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
	python-pathlib
	python-plac
	python-preshed
	python-pydantic
	python-six
	python-srsly
	python-tqdm
	python-wasabi
)
makedepends=(
	git
	python-setuptools
	cython
)
provides=(python-thinc)
conflicts=(python-thinc)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd thinc
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd thinc
	python setup.py build
}

package() {
	cd thinc
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"    
}
