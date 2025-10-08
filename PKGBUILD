# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Andrew Shark <ashark linuxcomp ru>

pkgname="python-type-enforced"
_name=${pkgname#python-}
_name2="type_enforced"
pkgver=2.2.3
pkgrel=1
pkgdesc="Check if type annotations correspond the reality at runtime"
arch=("any")
url="https://github.com/connor-makowski/type_enforced"
license=("MIT")
depends=(python)
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/connor-makowski/type_enforced/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f61ecfe829b0fbc4d7f14d09947e016904f3fd96b79b688cc624e9fdd85f79e1')

build() {
	cd "${_name2}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name2}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name2}-${pkgver}-py3-none-any.whl"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
