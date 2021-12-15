# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-cffsubr
_pyname=${pkgname#python-}
pkgver=0.2.9.post1
pkgrel=1
pkgdesc='Standalone CFF subroutinizer based on AFDKO tx'
arch=(x86_64)
url="https://github.com/adobe-type-tools/$_pyname"
license=(Apache)
depends=(python
         python-fonttools)
makedepends=(python-setuptools-git-ls-files
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('6b31412dcf49c8fa84664bda867e2eddc55b6fe6fa696ff253c4f13a9ff2fc5c')

build() {
	cd "$_archive"
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
