# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.2.4
pkgrel=1
pkgdesc="Object oriented headers, HTTP/1.1 style. Also parse headers."
arch=('any')
url="https://www.kiss-headers.tech"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-cov')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('913558e2e18b42ea0891723ba7f8b88dc92df7d836cb8863d76d6b61d8618a42')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
