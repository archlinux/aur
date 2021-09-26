# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: BrainDamage
# Contributor: Jat
# Contributor: xantares

pkgname=python-flask-testing
_name="${pkgname#python-}"
pkgver=0.8.1
pkgrel=1
pkgdesc="Flask unittest integration"
url="https://github.com/jarus/flask-testing"
arch=('any')
license=('BSD')
depends=('python-flask')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-blinker')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('47663a4f6cd173bb22cda6e4691145697be742c5a0f6678e55a218bc6f2cfb0e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
	cd docs
	make man BUILDDIR="$srcdir"
}

check() {
	cd "$_name-$pkgver"
	python setup.py test
}

package_python-flask-testing() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "$srcdir/man/flask-testing.1" -t "$pkgdir/usr/share/man/man1/"
}
