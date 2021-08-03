# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cffsubr
_pyname=${pkgname#python-}
pkgver=0.2.8
pkgrel=2
pkgdesc='Standalone CFF subroutinizer based on AFDKO tx'
arch=(x86_64)
url="https://github.com/adobe-type-tools/$_pyname"
license=(Apache)
depends=(python-fonttools)
makedepends=(python-setuptools-{git-ls-files,scm})
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('e24bd03c94944e1536ec8437ab83fb4ac38477412426c1ffd4e056dd16cde235')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build_ext --inplace
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
