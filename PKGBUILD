# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=python-specfile
_pkgname=${pkgname#python-}
pkgver=0.32.1
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
b2sums=('860d6f896fdb773b7a4639bc2dfbc352a9a081d13a2ab2c68da693244af1d619f80c519c408535191206eaca1fafbd1582d47fe8607b01a2e4edeacfa7869612')

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
