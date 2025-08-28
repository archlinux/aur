# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Andrew Shark <ashark linuxcomp ru>

pkgname="python-type-enforced"
_name=${pkgname#python-}
_name2="type_enforced"
pkgver=2.2.2
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
sha256sums=('e462603d8e9d335c22ae078bf6fcdf731cc04df3252dc44a217fec568d3f1a43')

build() {
	cd "${_name2}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name2}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name2}-${pkgver}-py3-none-any.whl"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
