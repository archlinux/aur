# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mintotp
pkgver=0.3.0
pkgrel=1
pkgdesc="Minimal TOTP generator"
arch=('any')
url="https://github.com/susam/mintotp"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-mock')
provides=('python-mintotp')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('38bfac7187eaa61dd557773dc9fe1bd465ce5d5e4587b9b91652085860ddaefd')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python -m unittest
}

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
