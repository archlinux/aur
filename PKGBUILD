# Maintainer: Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-playsound3
_reponame=playsound3
pkgver=3.2.6
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
sha256sums=('ff1cb2891a59b095cdd6878b730072d43a3cf5ac9f89db2fb7b544a6ef821bdc')

build() {
	cd "${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_reponame}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
