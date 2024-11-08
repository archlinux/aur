# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=python-specfile
_pkgname=${pkgname#python-}
pkgver=0.32.5
pkgrel=1
pkgdesc='A library for parsing and manipulating RPM spec files'
url='https://github.com/packit/specfile'
arch=('any')
license=(MIT)
makedepends=(
	python-build
	python-wheel
	python-installer
	python-setuptools-scm
	# Tests
	rpm-tools
	python-pytest
	python-flexmock
)
depends=(
	rpm-tools
	python-typing_extensions
)
_archive="$_pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9ef1e0088250923605217730b15b19e7fae8dafc4f6459048cbfb84946b8062b04cdfcf8bb1f4f85c329f27e945d33a2237476fc011829e85c350d5d2ada26e2')

build(){
	cd $_archive
	python -m build --wheel --no-isolation
}
check(){
	cd $_archive
	pytest -k 'not test_update_tag'
}
package(){
	cd $_archive
	python -m installer --destdir="$pkgdir" dist/*.whl
}
