# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v0.2.6
pkgver="${_pkgver#v}"
pkgrel=5

_pkgname=type-lens
pkgname="python-${_pkgname}"

pkgdesc='Runtime type introspection utilities'
arch=('any')
url='https://github.com/litestar-org/type-lens'
license=('MIT')

depends=(
	'python>=3.8' 'python<4.0'
	'python-typing_extensions>=4.1.0'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-hatchling')

source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('68a6f56d7f3cf776cc159354ff6ce67b40aeeefe494b44f54733b7b79f525321')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
