# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=bnunicodenormalizer
pkgname="python-${_name}"
pkgver=0.1.7
pkgrel=2
pkgdesc="Bangla Unicode Normalization Toolkit"
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
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/35/b4/b93d9cd7dc3906eaceafc340cb9e834f9f54fac84d51e00045bd6cb9d3e6/${_name}-${pkgver}.tar.gz"
)
sha256sums=('86a3489cc81c73d2afb4e265bd2d0d8bc52fc8a2374e210c899e0260940bc091')

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
