# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: peippo <christoph+aur@christophfink.com>

pkgname=python-unicodecsv
_name=${pkgname#python-}
pkgdesc="Drop-in replacement for the csv module that supports unicode strings"
pkgver=0.14.2
pkgrel=1
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/jdunck/python-unicodecsv"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('ed8a2b448575f284d042183e6a0498bb6985b5f3ced7eaeacea7f51549522688')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
