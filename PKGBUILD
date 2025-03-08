# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-graphsrv
_pkg=graphsrv
pkgver=2.1.1
pkgrel=1
pkgdesc='Serve embeddable graphs'
arch=('any')
url="https://github.com/20c/graphsrv"
license=('Apache')
depends=('python-flask' 'python-vodka')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0516d58c4e834acdbb8f10263bf4288bfb440553a7341bb0155614ed1d1ed5a4')

prepare() {
	sed -i '/packages=/s/()/(exclude=["*tests*"])/' "$_pkg-$pkgver/setup.py"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
