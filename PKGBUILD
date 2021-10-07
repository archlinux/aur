# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nils Steinger (voidptr.de)

pkgname=python-rubymarshal
pkgver=1.2.10
pkgrel=1
pkgdesc="Read and write Ruby-Marshalled data"
url='https://github.com/d9pouces/RubyMarshal'
arch=('any')
license=('custom:WTFPL')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-nose>=1.3.7' 'python-hypothesis>=5.24.0' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a09bccd8125e8e09f9c11146fafaba5283d16c369d0751f9765ddc009321df9e')

build() {
	cd "RubyMarshal-$pkgver"
	python setup.py build
	cd doc
	make man
}

check() {
	cd "RubyMarshal-$pkgver"
	nosetests rubymarshal_tests
}

package() {
	cd "RubyMarshal-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 doc/build/man/rubymarshal.1 -t "$pkgdir/usr/share/man/man1/"
}
