# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-rabbitpy
pkgver=2.0.1
pkgrel=1
pkgdesc="Pure python, thread-safe, minimalistic and pythonic RabbitMQ client library"
url="https://rabbitpy.readthedocs.org"
license=('BSD')
arch=('any')
depends=('python-pamqp>=2.3.0' 'python-pamqp<3.0')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-nose' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gmr/rabbitpy/archive/$pkgver.tar.gz")
sha256sums=('22c826eec4a7dbdb995f93978ffa0214e3564bc116aab5fe9f9900d1d24a2762')

build() {
	cd "rabbitpy-$pkgver"
	python setup.py build
	cd docs
	make man
}

check() {
	cd "rabbitpy-$pkgver"
	python setup.py nosetests
}

package() {
	cd "rabbitpy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 docs/_build/man/rabbitpy.1 -t "$pkgdir/usr/share/man/man1/"
}
