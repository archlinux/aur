# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=fontaine
_pyname=py$_pipname
pkgname=python-$_pipname
pkgver=1.4.0
pkgrel=4
pkgdesc='Font analysis tool for determining character/glyph support'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(GPL-3.0-only)
_pydeps=(fonttools
         lxml
         pyicu
         requests
         tabulate)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('92215da45fed003032e5849e3d0917aaae9024e255affe9d28c67aed0223f11e')

prepare() {
	cd "$_archive"
	echo "version = '$pkgver'" > "$_pipname/_version.py"
	sed -i -e '/_scm/d' setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
