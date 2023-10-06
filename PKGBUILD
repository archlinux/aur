# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-jupyter_ascending
_pkgname="${pkgname#python-}"
pkgver=0.1.26
pkgrel=1
pkgdesc='Edit Jupyter notebooks using your favorite editor'
arch=('any')
url=https://github.com/untitled-ai/jupyter_ascending
license=('MIT')
depends=(
	'python'
	'python-jupytext'
	'python-jsonrpcserver'
	'python-jsonrpcclient'
	'python-loguru'
	'python-poetry-core'
	'python-edlib'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f939de2acce7805a274971f32c96ac0d8e569fda22e34d3ada34526e0a82e9f9e308ac88553cd7420017771540b3767d3037b9d3da7b8351c668aa2eab654131')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
