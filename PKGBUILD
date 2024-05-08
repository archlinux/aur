# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vfbLib
pkgname=python-${_pipname,,}
pkgver=0.6.4
pkgrel=1
pkgdesc='Tools for converting FontLab Studio 5 (VFB) files'
arch=(any)
url="https://github.com/LuasFonts/$_pipname"
license=(GPL-3.0-only)
_pydeps=(defcon
         fonttools
         fs # for fonttools[ufo]
         ufonormalizer
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive=$_pipname-$pkgver
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
sha256sums=('0fc962be6cf04baa24cb222cfebf3e2c71231910669e7c0c662337b62d700e88')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
