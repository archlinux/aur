# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v0.32.2
pkgver="${_pkgver#v}"
pkgrel=3

_pkgname=cappa
pkgname="python-${_pkgname}"

pkgdesc='Declarative CLI argument parser '
arch=('x86_64')
url='https://github.com/DanCardin/cappa'
license=('Apache-2.0')

depends=(
	'python>=3.8' 'python<4.0.0'
	'python-rich>=12.1.0'
	'python-typing_extensions>=4.8.0'
	'python-type-lens>=0.2.5'
)

makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-hatchling')

optdepends=('python-docstring-parser')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('e660a57e3d7a06beacf7c21e07c6aeb40b36803ed4c17c922d9d556c467a536c')

prepare() {
	git -C "${_pkgname}" clean -dfx # Clean out old wheels etc.
}

build() {
	cd "${_pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
