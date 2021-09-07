# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=pyinstrument_cext

pkgname=python-pyinstrument_cext
pkgver=0.2.4
pkgrel=2
pkgdesc="CPython extension supporting pyinstrument"
arch=('x86_64')
url="https://github.com/joerick/pyinstrument_cext"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('920c5c584077c13c436829133624b0ba189a1d73b6bba49c79b3e1a46879c9a0')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python setup.py nosetests
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
