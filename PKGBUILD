# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-tinyrecord
pkgver=0.2.1
pkgrel=1
pkgdesc="Atomic transactions for TinyDB"
arch=('any')
url="https://github.com/eugene-eeo/tinyrecord"
license=('MIT')
depends=('python-tinydb>=4.0.0')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url#commit=6affc1814314e067f266a65d9d7d21b2e978b23f?signed")
sha256sums=('SKIP')
validpgpkeys=('BB354D48E3A3B416AC1242CB517D153BDE152D17')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	pytest tests.py
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
