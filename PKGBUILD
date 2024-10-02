# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-tradingeconomics
_pkg="${pkgname#python-}"
pkgver=4.3.11
pkgrel=1
pkgdesc='A library providing an API allowing access to Trading Economics data.'
arch=('any')
url='https://github.com/tradingeconomics/tradingeconomics-python'
license=('GPL-3.0-only')
depends=('python' 'python-pandas' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('852545e9fef4b935530fe1147b1ba5b1c5acfa6206520c604d6a8657d77ac54f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
