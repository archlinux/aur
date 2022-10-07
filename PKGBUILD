# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dvc-render
_pkgname=${pkgname#python-}
pkgver=0.0.12
pkgrel=1
pkgdesc='Library for rendering DVC plots'
arch=(any)
license=(Apache)
url="https://github.com/iterative/$_pkgname"
_pydeps=(funcy
         tabulate)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer} python-setuptools-scm{,-git-archive} python-wheel)
checkdepends=(mypy
              python-pytest
              python-pytest-sugar
              python-pytest-mock
              python-pylint)
_archive=("$_pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('faf331a37f0f3999284e2c7d16d76a51d073b93156bed145f32d0215c699d26f')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	# PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-${_pyver}"
	# pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
