# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-scmrepo
_pyname=${pkgname#python-}
pkgver=3.6.2
pkgrel=1
pkgdesc='SCM wrapper and fsspec filesystem for Git for use in DVC'
arch=(any)
license=(Apache-2.0)
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
sha256sums=('750741af151e4c602dbf1456b49c7a1d27844527ba94db1e0c580b167cbd9316')

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
