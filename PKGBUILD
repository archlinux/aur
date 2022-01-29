# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pluginmgr
pkgver=1.0.1
pkgrel=1
pkgdesc='Lightweight Python plugin system supporting config inheritance'
arch=('any')
url="https://github.com/20c/pluginmgr"
license=('Apache')
depends=('python-munge')
makedepends=('python-poetry' 'python-build' 'python-install')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ba7dd2707026130f86f8d28d2c9051767f8c6dd1d9dce0fbf18c645d7c0ba266')

build() {
	cd "pluginmgr-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd "pluginmgr-$pkgver"
	PYTHONPATH=./src pytest -x -c /dev/null
}

package() {
	cd "pluginmgr-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
