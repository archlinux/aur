# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-scmrepo
_pyname=${pkgname#python-}
pkgver=0.1.4
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
sha256sums=('e552f85a31bb4afb065da3e29eaf7464e3bcf281fb2d22ad8ebccfc3ae673174')

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
