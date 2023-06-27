# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-jupyter_ascending
_pkgname="${pkgname#python-}"
pkgver=0.1.25
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
sha512sums=('b4cf552b1749b670916b4c31aad73d42155734755a3f88baf7dfacb6bcab3cb88ab4d3918d9b164244e08ea6bb10af3e5a1b44f88e04a7c80a3b5386719f2b60')

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
