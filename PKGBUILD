# Maintainer: djsigmann <aur+djsigmann@protonmail.com>

# shellcheck disable=SC2164

_pkgver=v0.2.6
pkgver="${_pkgver#v}"
pkgrel=3

_pkgname=type-lens
pkgname="python-${_pkgname}"

pkgdesc='Runtime type introspection utilities'
arch=('x86_64')
url='https://github.com/litestar-org/type-lens'
license=('MIT')

depends=(
	'python>=3.8' 'python<4.0'
	'python-typing_extensions>=4.1.0'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-hatchling')

source=("git+${url}#tag=${_pkgver}")
sha256sums=('5dc1b3f86bac7f23442b9dfb178f83ea2a7615288506118ce628be59501323b3')

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
