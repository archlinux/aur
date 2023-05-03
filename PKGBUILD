# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=openstep_plist
pkgname=python-${_pyname/_/-}
pkgver=0.3.0.post1
pkgrel=2
pkgdesc='OpenStep plist parser and writer written in Cython'
arch=(x86_64)
url="https://github.com/fonttools/$_pyname"
license=(MIT)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('18aff3d5eded9ebfbedfeba444a3c048324697bf8a39bb04361c0dd53bfeab0b')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	python -m unittest discover
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
