# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate
# Previous maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname="python-type-enforced"
_name=${pkgname#python-}
_name2="type_enforced"
pkgver=1.8.1
pkgrel=1
pkgdesc="Check if type annotations correspond the reality at runtime"
arch=("any")
url="https://pypi.org/project/${_name}"
license=("MIT")
depends=(python)
makedepends=(
	python-build
	python-installer
	python-setuptools
	python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/connor-makowski/type_enforced/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e0c6614c0f720eb5e1bf9a5a11f55b5a6084de0171bc871ed041bea1507c4811')

build() {
	cd "${_name2}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name2}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name2}-${pkgver}-py3-none-any.whl"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
