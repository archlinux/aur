# Maintainer: Bao Trinh <qubidt at gmail dot com>

_pkgname=jupyter_ascending
pkgname=python-jupyter_ascending
pkgver=0.1.23
pkgrel=1
pkgdesc='Edit Jupyter notebooks using your favorite editor'
arch=('any')
url=https://github.com/untitled-ai/jupyter_ascending
license=('MIT')
depends=(
	'python'
	'python-ipywidgets'
	'python-jupytext'
	'python-jsonrpcserver'
	'python-jsonrpcclient'
	'python-loguru'
	'python-attrs'
	'python-toml'
	'python-edlib'
)
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('63eab2459f8bb1b08e8a4adbeb44f78a775db34eec0e212503a5bdbe52878519d07717efeb0574bd262c2e693e90c4beec11d42524e7e57d1cbd1f186352566d')

prepare() {
	cd "${_pkgname}-${pkgver}"
	sed -i '/ensure_python/d' setup.py
}

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --optimize=1 --root="$pkgdir" --skip-build
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
