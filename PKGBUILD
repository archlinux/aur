# Maintainer: Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-playsound3
_pkg=playsound3
pkgver=2.5.0
pkgrel=1
pkgdesc="Pure Python library for playing sounds"
arch=('any')
url="https://github.com/sjmikler/playsound3"
license=('MIT')
depends=(
	'python'
	'python-certifi'
	'python-gobject'
	'gstreamer')
makedepends=(
	'python-build'
	'python-installer'
	'python-hatchling'
	'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/p/${_pkg}/${_pkg}-${pkgver}.tar.gz")
sha256sums=('67baba0bfa41b8a53bf2f2bd2ac42787c977253afc94323d8dcfe1ca0f4dfd66')

build() {
	cd "${_pkg}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkg}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
