# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dvc-render
pkgver=0.0.4
pkgrel=1
pkgdesc='Library for rendering DVC plots'
arch=(any)
license=(Apache)
url="https://github.com/iterative/${pkgname}"
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
_archive=("$pkgname-$pkgver")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('1cc460b05d3b26c8fbfdbf7fab642b89b53ec6461547909e3f7cf5d7e72d8364')

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
