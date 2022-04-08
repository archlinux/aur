# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-munge
pkgver=1.2.1.1
pkgrel=3
pkgdesc='Data manipulation client/library'
arch=('any')
url='https://github.com/20c/munge'
license=('Apache')
depends=('python-requests' 'python-click')
optdepends=('python-toml' 'python-tomlkit' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-toml' 'python-tomlkit' 'python-yaml')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3ac675a807a624f59dfe9c27bb8ad41b52d7328a9b3828ae656c524c8cf34c15')

build() {
	cd "munge-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "munge-$pkgver"
	PYTHONPATH=src python -m pytest -x
}

package() {
	cd "munge-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 docs/api.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
