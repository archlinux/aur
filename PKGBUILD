# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-scmrepo
_pyname=${pkgname#python-}
pkgver=0.0.7
pkgrel=1
pkgdesc='SCM wrapper and fsspec filesystem for Git for use in DVC'
arch=(any)
license=(Apache)
url="https://github.com/iterative/${_pyname}"
_pydeps=(asyncssh
         dulwich
         fsspec
         funcy
         gitpython
         pathspec
         pygit2
         pygtrie)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-dephell
             python-setuptools)
checkdepends=(python-pytest)
_archive=("$_pyname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('0dd8ac0e0ca8223d5b2efacb77b2cb49ec3cc383241cc69d1ef7595736a4b0a9')

prepare(){
	cd "$_archive"
	dephell deps convert --from pyproject.toml --to setup.py
}
build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	# PyPi release missing tests
	# pytest
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
