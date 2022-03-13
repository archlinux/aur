# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pipdate
pkgver=0.5.5
pkgrel=2
pkgdesc="Updates all pip-installed packages"
arch=('any')
url="https://github.com/nschloe/pipdate"
license=('GPL3')
depends=('python-appdirs' 'python-rich' 'python-requests' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-matplotlib')
optdepends=('python-importlib-metadata: REQUIRED for python<3.8')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('507f15f656b45a46f7ad32f1ceb4e5cc8fcd9c3e6293ee7004921d1e3d1bd291')

build() {
	cd "pipdate-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pipdate-$pkgver"
	PYTHONPATH=./src pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "pipdate-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
