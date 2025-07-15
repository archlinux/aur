# Maintainer: Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-playsound3
_reponame=playsound3
pkgver=3.2.4
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sjmikler/playsound3/archive/v${pkgver}.tar.gz")
sha256sums=('8a11deb4c77348558c8cbe8e0356b991754d105063eddba4c6ec0a553e169b05')

build() {
	cd "${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_reponame}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
