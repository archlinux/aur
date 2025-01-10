# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=vfbLib
pkgname=python-${_pyname,,}
pkgver=0.8.2
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
             python-setuptools)
_archive=${_pyname,,}-$pkgver
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('726488a008cf7742a0f0296908b7472426ee7fcf3046fe10620e4f96023c0602')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
