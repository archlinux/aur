# Maintainer: Kimiblock Moe

pkgname=python-websockets-git
pkgdesc="Library for building WebSocket servers and clients in Python"
url="https://github.com/python-websockets/websockets"
license=(unknown)
arch=(any)
pkgver=14.2.r41.g5b516463
pkgrel=1
makedepends=(python-build python-installer python-wheel git python-setuptools)
depends=('python>3.9')
provides=(python-websockets)
conflicts=(python-websockets)
source=(
	"git+https://github.com/python-websockets/websockets.git"
)
md5sums=(
	"SKIP"
)

function pkgver() {
	cd "${srcdir}/websockets"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build() {
	cd "${srcdir}/websockets"
	python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/websockets"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
