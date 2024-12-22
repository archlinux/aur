# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=bnnumerizer
pkgname=python-${_name}
pkgver=0.0.2
pkgrel=2
pkgdesc="Bangla Number text to String Converter"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('BSD')
depends=('python')
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/4d/81/5c37f0d12262fc8ebdb8353bab744cc2f32b05d78b6d02c3801489ad349c/${_name}-${pkgver}.tar.gz"
)
sha256sums=('41df6fd0b7b51aa4ec4776b6643cedebee5fd11e335d7d56d4a20c08515e5f0d')

build() {
	cd "${_name}-${pkgver}"
	# Note: set `GIT_CEILING_DIRECTORIES` to prevent poetry
	# from incorrectly using a parent git checkout info.
	# https://github.com/pypa/build/issues/384#issuecomment-947675975
	GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
