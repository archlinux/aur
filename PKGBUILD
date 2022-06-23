# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-gputil
_pkg="${pkgname#python-}"
pkgver=1.4.0
pkgrel=4
pkgdesc="Fetches GPU status from NVIDIA GPUs using nvidia-smi"
arch=('any')
url="https://github.com/anderskm/gputil"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6da9cef276a98d4fd152312aecc7fd977754b480407f67b64b615a12c7ebd3cb')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
