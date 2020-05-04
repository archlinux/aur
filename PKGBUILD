# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-thinc
_origpkgname=thinc
pkgver=8.0.0a3
pkgrel=1
pkgdesc="Practical Machine Learning for NLP"
arch=("x86_64")
url="https://github.com/explosion/thinc"
license=("MIT")
depends=("cython"
	"python-numpy"
	"python-cymem"
	"python-preshed"
	"python-murmurhash"
	"python-plac"
	"python-mock"
	"python-pathlib"
	"python-catalogue"
	"python-ml-datasets"
	"python-tqdm"
	"python-hypothesis"
	"python-blis"
	"python-six"
	"python-tqdm"
	"python-srsly"
	"python-wasabi"
	"python-pydantic"
)
makedepends=("python-setuptools" "python-wheel")
optdepends=("python-spacy: examples" "python-ipykernel: for running more included tests" )
checkdepends=("python-pytest-cov" "flake8" "mypy")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/thinc/archive/v$pkgver.tar.gz")
md5sums=('18715c92f14431b382e71398649a1d78')

build() {
	cd "$_origpkgname-$pkgver"
	python setup.py build_ext --inplace
}

check() {
  cd "$_origpkgname-$pkgver"
  python -m pytest thinc --cov=thinc
}

package() {
    cd "$_origpkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}


