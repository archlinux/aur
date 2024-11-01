# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-tradingeconomics
_pkg="${pkgname#python-}"
pkgver=4.4.0
pkgrel=1
pkgdesc='A library providing an API allowing access to Trading Economics data.'
arch=('any')
url='https://github.com/tradingeconomics/tradingeconomics-python'
license=('GPL-3.0-only')
depends=('python' 'python-pandas' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('13c72f7b50459e72a38b2defdab8d9602ff7a80bb833b4bbe68dbf8f83bfdc93')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
