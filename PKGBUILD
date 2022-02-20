# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-icecream
pkgver=2.1.2
pkgrel=1
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
depends=('python-colorama' 'python-pygments' 'python-executing' 'python-asttokens')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('icecream-debugging')
changelog=changelog.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/icecream/icecream-$pkgver.tar.gz")
sha256sums=('09300b2d1c678712410cbd47c95198eb1b580f66f311a554ccd6b9e758ece0ee')

build() {
	cd "icecream-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "icecream-$pkgver"
	python setup.py test
}

package() {
	export PYTHONHASHSEED=0
	cd "icecream-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
