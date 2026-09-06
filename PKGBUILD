# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v0.32.2
pkgver="${_pkgver#v}"
pkgrel=5

_pkgname=cappa
pkgname="python-${_pkgname}"

pkgdesc='Declarative CLI argument parser '
arch=('any')
url='https://github.com/DanCardin/cappa'
license=('Apache-2.0')

depends=(
	'python>=3.8' 'python<4.0.0'
	'python-rich>=12.1.0'
	'python-typing_extensions>=4.8.0'
	'python-type-lens>=0.2.5'
)

makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-hatchling')

optdepends=('python-docstring-parser')

source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('7c87af9c905b787691b5a8e53a1ca6d55ec775b964c24473896203e9f6e1df40')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
