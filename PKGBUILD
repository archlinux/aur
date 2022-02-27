# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-aktools
pkgver=0.0.50
pkgrel=1
pkgdesc="HTTP server library for AkShare"
arch=('any')
url='https://github.com/akfamily/aktools'
license=('MIT')
depends=('python-akshare' 'python-fastapi' 'uvicorn' 'python-python-multipart')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f48a321b6d82dcc0e67dce166ccfc68ca9dbc2cce3a18f5063d2ea8a578fd43e')

prepare() {
	cd "aktools-$pkgver"
	sed -i "/packages=/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "aktools-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "aktools-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
