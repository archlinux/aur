# Maintainer: Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-playsound3
_reponame=playsound3
pkgver=3.3.2
pkgrel=1
pkgdesc="Pure Python library for playing sounds"
arch=('any')
url="https://github.com/szmikler/playsound3"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/szmikler/playsound3/archive/v${pkgver}.tar.gz")
sha256sums=('79f14fcd72385e7413f88fee2ae7d9440e726c4bd1182f382e669f892f27af07')

build() {
	cd "${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_reponame}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
