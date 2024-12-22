# Maintainer: Actionless Loveless <actionless DOT loveless PLUS aur AT gmail MF com>

_name=keopscore
pkgname=python-${_name}
pkgver=2.2.3
pkgrel=3
pkgdesc="keopscore is the KeOps meta programming engine. This python module should be used through a binder (e.g. pykeops or rkeops)"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
depends=('python')
makedepends=(
	'python-wheel'
	'python-hatchling'
	'python-build'
	'python-installer'
	'python-setuptools'  # i think it normally should be required by python-pep517 which required by python-build/installer
)
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/66/31/1da3877139d75e392f5fd0cbdc3b718ae726f5308ed792d385250c43167c/${_name}-${pkgver}.tar.gz"
)
sha256sums=('64d5dad1e8c806d7070cdc60e48fd5bbf006f2bf1afd39ad3fa5e9fb213517d2')

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
