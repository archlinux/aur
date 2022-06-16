# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pipdate
_pkg="${pkgname#python-}"
pkgver=0.5.6
pkgrel=1
pkgdesc="Updates all pip-installed packages"
arch=('any')
url="https://github.com/nschloe/pipdate"
license=('GPL3')
depends=('python-appdirs' 'python-rich' 'python-requests' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-matplotlib')
optdepends=('python-importlib-metadata: REQUIRED for python<3.8')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c38ea9ad6d026bced2eaa491eca148a45f6c227a0b04b4f3e4aa16fe2e70f77f')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH=./src pytest -x
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
