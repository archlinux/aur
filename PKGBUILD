# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v1.1.0
pkgver=1.1.0
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
sha256sums=('e02e3d4907814d1e7fbeda6eecf26f7dd9aaa8ef4e4a609272858e5e362e6f44')

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
