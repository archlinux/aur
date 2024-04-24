# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-scmrepo
_pyname=${pkgname#python-}
pkgver=3.3.2
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
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-cryptography
              python-typing_extensions
              python-pytest)
_archive=("$_pyname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('a817334bf005275e7f0f98d768ce21bb5cbfc05676a0d6081372eb927e7c737b')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# tests require pytest_test_utils, disabled until packaged
	# pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
