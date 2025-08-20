# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgname=valve-parsers

pkgname="python-${_pkgname}-git"
pkgver=9dbe663
pkgrel=3

pkgdesc='Some parsers for Valve game files - written in python.'
arch=('x86_64')
url='https://github.com/cueki/valve-parsers'
license=('MIT')

depends=('python>=3.8')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	git -C "${_pkgname}" describe --tag --always | sed 's/^v//; s/-/./g'
}

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
