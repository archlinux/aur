# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=python-jupyter_ascending
_pkgname="${pkgname#python-}"
pkgver=0.1.24
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
sha512sums=('eb379eb0d5b2ddb633eaad327454c949991d720a7e3f3378fa5a3ae2e228ea08fe53252dce117a7ea5cbc6e6fd2a07d67a4993ba07acb756a441b4dcdbcc15e7')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "README.md"
}
