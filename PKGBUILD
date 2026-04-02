# Maintainer: attackuwu <daniil.baskakov13@gmail.com>
# Contributor (was the parent of the package until April 2, 2026.): Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pluginmgr
pkgver=1.2.1
pkgrel=3
pkgdesc='Lightweight Python plugin system supporting config inheritance'
arch=('any')
url="https://github.com/20c/pluginmgr"
license=('Apache-2.0')
depends=('python' 'python-munge' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-pytest-forked')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1f2e3428619d379346389e5d568f08fcc22abe3409eea57ef4fa2472c2e8dc14')

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
