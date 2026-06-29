# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=glyphsets
pkgname=python-${_pyname,,}
pkgver=1.1.3
pkgrel=1
pkgdesc='an API with data about glyph sets for many different scripts and languages'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
_pydeps=(defcon
         fonttools
         fs # for fonttools[ufo]
         glyphslib)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('609e6136ad90808810167309fb22463b3b0b46951a6d2a89b6d5445ac44305a4')

prepare() {
	cd "$_archive"
	# bad clamping
	sed -i -e '/setuptools_scm/s/scm.*"/scm"/' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
