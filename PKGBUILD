# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-jupyter_ascending
_pkgname="${pkgname#python-}"
pkgver=0.1.27
pkgrel=2
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
sha512sums=('66ebf74128f9690518b6a257324250410849a722f4c4cab4a292858b70a0f077505bafedfd1f3b119dcec9cf4573b00e695feaf8b20faea614752a5205d50635')

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
