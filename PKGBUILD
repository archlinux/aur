# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-tradingeconomics
_pkg="${pkgname#python-}"
pkgver=4.3.8
pkgrel=1
pkgdesc='A library providing an API allowing access to Trading Economics data.'
arch=('any')
url='https://github.com/tradingeconomics/tradingeconomics-python'
license=('GPL-3.0-only')
depends=('python' 'python-pandas' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('6a104d7816d4d8d86632dcb6a3178f3e9c0286f91d6ad1bac5133f94dd91d848')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
