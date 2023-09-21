# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: shieldwed <shieldwed [at] outlook [dot] com>

pkgname=python-iptools
pkgver=0.7.0
pkgrel=3
pkgdesc="Collection of utilities for dealing with IP addresses"
url="https://python-iptools.readthedocs.org/"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bd808/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5ea59c0867e72d8243305ff1297fc5b2d8feaca650369a29985453ce4f39ca97')

build() {
	pushd "$pkgname-$pkgver"
	python setup.py build
	cd docs
	make man BUILDDIR="$srcdir"
}

check() {
	pushd "$pkgname-$pkgver"
	nosetests
}

package() {
	install -Dm 644 man/iptools.1 -t "$pkgdir/usr/share/man/man1/"
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
