# Maintainer: Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-playsound3
_pkg=playsound3
pkgver=2.5.1
pkgrel=2
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
sha256sums=('27820907a613fab5797e575539b811d30867859cdfdc5f759c08084ff91a205a')

build() {
	cd "${_pkg}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkg}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
