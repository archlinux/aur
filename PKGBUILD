# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Andrew Shark <ashark linuxcomp ru>

pkgname="python-type-enforced"
_name=${pkgname#python-}
_name2="type_enforced"
pkgver=2.6.0
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
sha256sums=('7a1e83fc7d1161af4ce405206f1d58471b2150f8366a4911a9de835431c2c61b')

build() {
	cd "${_name2}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name2}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_name2}-${pkgver}-py3-none-any.whl"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
