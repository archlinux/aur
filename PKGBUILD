# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=python-specfile
_pkgname=${pkgname#python-}
pkgver=0.32.2
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
b2sums=('bbb761e071ebf42bb3bc0efdb89637b436135cb87ad4f26442202eb6b6e53b47b4c6662013dd836a38c0ab7f10483ee23886a328ffa5eac65a1aa0f549f18b08')

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
