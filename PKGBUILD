# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-xgridfit
_pkgname=${pkgname#python-}-3
pkgver=3.2.1
pkgrel=3
pkgdesc='an XML-based language for hinting TrueType fonts inspired my XSLT'
arch=(any)
url="https://github.com/psb1558/$_pkgname"
license=(Apache-2.0)
_pydeps=(fonttools
         lxml
         setuptools # yes, pkg_resources needed at runtime :(
         pyyaml)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel})
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('362c6a3df1fe22a19ecf262ea2727bdfc6122c4be7c1ab7cce3b0313eb7dfd38')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

