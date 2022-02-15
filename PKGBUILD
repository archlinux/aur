# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=glyphsets
pkgname=python-${_pyname,,}
pkgver=0.2.1
pkgrel=1
pkgdesc='an API with data about glyph sets for many different scripts and languages'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(fonttools)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('dab3c915f1137eb5a16ea22b679b9e1408d1184134946b1905d90268fe46fe82')

prepare() {
	cd "$_archive"
	# Upstream requires outdated setuptools_scm, work around
	sed -i -e '/_scm/d' setup.py
	echo "version = '$pkgver'" > Lib/glyphsets/_version
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
