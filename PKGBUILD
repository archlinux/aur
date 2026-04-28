# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=vfbLib
pkgname=python-${_pyname,,}
pkgver=0.11.3
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
sha256sums=('b6fac52030cd60c36a759d65f80ffedf87578346d774dd8743935a337f8dbad5')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
