# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: orumin <dev@orum.in>

pkgname=python-jxmlease
pkgver=1.0.3
pkgrel=1
pkgdesc="XML to Python object conversion library"
arch=('any')
url="https://github.com/Juniper/jxmlease"
license=('MIT')
depends=('python')
optdepends=('python-lxml')
makedepends=('python-setuptools' 'python-sphinx')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6b1fd14f192450601d4ea5d0fbb2c7e49f9bc6e9ab9530dcf91c8ef57f65ed4d')

build() {
	cd "jxmlease-$pkgver"
	python setup.py build
	cd docs
	make man
}

check() {
	cd "jxmlease-$pkgver"
	python -m unittest discover
}

package() {
	export PYTHONHASHSEED=0
	cd "jxmlease-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/man/jxmlease.1 -t "$pkgdir/usr/share/man/man1/"
}
