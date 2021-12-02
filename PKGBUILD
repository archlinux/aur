# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-factory_boy
pkgver=3.2.1
pkgrel=1
pkgdesc="Test fixtures replacement for Python"
arch=('any')
url="https://github.com/factoryboy/factory_boy"
license=('MIT')
depends=('python>=3.6' 'python-faker')
makedepends=('python-setuptools')
checkdepends=('python-django' 'python-sqlalchemy')
replaces=('python-factoryboy')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/factory_boy/factory_boy-$pkgver.tar.gz")
sha256sums=('a98d277b0c047c75eb6e4ab8508a7f81fb03d2cb21986f627913546ef7a2a55e')

build() {
	cd "factory_boy-$pkgver"
	python setup.py build
}

check() {
	cd "factory_boy-$pkgver"
	SKIP_MONGOENGINE=1 python -m unittest
}

package() {
	cd "factory_boy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
