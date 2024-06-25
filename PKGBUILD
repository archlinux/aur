# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-tradingeconomics
_pkg="${pkgname#python-}"
pkgver=4.3.5
pkgrel=1
pkgdesc='A library providing an API allowing access to Trading Economics data.'
arch=('any')
url='https://github.com/tradingeconomics/tradingeconomics-python'
license=('GPL-3.0-only')
depends=('python' 'python-pandas' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('ce7825180fb1e9f10dcad4aab0bcfebd9e90623e50c26e5282a925da6a65a151')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
