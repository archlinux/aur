# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v1.2.2
pkgver="${_pkgver#v}"
pkgrel=5

_pkgname=valve-parsers
pkgname="python-${_pkgname}"

pkgdesc='Some parsers for Valve game files - written in python.'
arch=('any')
url='https://github.com/cueki/valve-parsers'
license=('MIT')

depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-setuptools')

source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('1b69c1c564d4489419903dd1ebef971e08b4076645600b1051d020b4ebdba871')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
