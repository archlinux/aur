# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vttLib
pkgname=python-${_pipname,,}
pkgver=0.12.1
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=(any)
url="https://github.com/daltonmaag/$_pipname"
license=(MIT)
_pydeps=(fonttools
         fs # for fonttools[ufo]
         pyparsing
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="${_pipname,,}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
sha256sums=('5af62dd2f41c0dcab90e36059f19de3699d74dd4a411c73a48cb6b8cb2ce5b26')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
