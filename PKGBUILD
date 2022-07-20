# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=python-aiotdlib
pkgname=${_pkgbase}-git
pkgver=0.19.2.r10.g50af307
pkgrel=1
pkgdesc="Python asyncio Telegram client based on TDLib (git version)"
arch=('x86_64')
url="https://github.com/pylakey/aiotdlib"
license=('MIT')
depends=('python' 'python-pydantic' 'python-sortedcontainers' 'python-ujson')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core' 'python-jinja')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgbase}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgbase}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
