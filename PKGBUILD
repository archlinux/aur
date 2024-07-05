# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=python-specfile
_pkgname=${pkgname#python-}
pkgver=0.31.0
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
b2sums=(
	'c9adf56164816e0dc84c8903198c74664b10f847e40735597afa1c73c93e495ff8aa12d37f723d61155bd974578e32a9f7d76d814ab02e3d6d3e4168b2785457'
)

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
