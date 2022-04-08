# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pluginmgr
pkgver=1.1.0.1
pkgrel=1
pkgdesc='Lightweight Python plugin system supporting config inheritance'
arch=('any')
url="https://github.com/20c/pluginmgr"
license=('Apache')
depends=('python-munge')
makedepends=('python-poetry' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-xdist')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('266207235945c14cf358bfb95ffb8c8f104a8d18ef9321d0b3c5f437011b9792')

build() {
	cd "pluginmgr-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pluginmgr-$pkgver"
	PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
	cd "pluginmgr-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
