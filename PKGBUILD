# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=vfbLib
pkgname=python-${_pyname,,}
pkgver=0.11.0
pkgrel=1
pkgdesc='Tools for converting FontLab Studio 5 (VFB) files'
arch=(any)
url="https://github.com/LuasFonts/$_pyname"
license=(GPL-3.0-only)
_pydeps=(defcon
         fonttools
         fs # for fonttools[ufo]
         ufonormalizer
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive=${_pyname,,}-$pkgver
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('d70e8d553a302bd28d2ae8f6192e3dc3a55f70674202f5042e66b3eddfa63144')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
