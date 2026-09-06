# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v1.2.2
pkgver="${_pkgver#v}"
pkgrel=4

_pkgname=valve-parsers
pkgname="python-${_pkgname}"

pkgdesc='Some parsers for Valve game files - written in python.'
arch=('any')
url='https://github.com/cueki/valve-parsers'
license=('MIT')

depends=('python>=3.8')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('cf16e01219852879ba4de813c30f2a4c46feb455edb789d3cfc1a2f99d39bccf')

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
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
