# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v1.2.1
pkgver=1.2.1
pkgrel=1

_pkgname=valve-parsers
pkgname="python-${_pkgname}"

pkgdesc='Some parsers for Valve game files - written in python.'
arch=('x86_64')
url='https://github.com/cueki/valve-parsers'
license=('MIT')

depends=('python>=3.8')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('2f968ff21d17f0094a4a9f05bbee2cdd6da379ca6879f42c5b7ae6640efab920')

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
