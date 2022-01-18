# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-icecream
pkgver=2.1.1
pkgrel=2
pkgdesc="Sweet and creamy print debugging"
arch=('any')
url="https://github.com/gruns/icecream"
license=('MIT')
depends=('python-colorama' 'python-pygments' 'python-executing' 'python-asttokens')
makedepends=('python-setuptools')
provides=('icecream-debugging')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/icecream/icecream-$pkgver.tar.gz")
sha256sums=('47e00e3f4e8477996e7dc420b6fa8ba53f8ced17de65320fedb5b15997b76589')

build() {
	cd "icecream-$pkgver"
	python setup.py build
}

check() {
	cd "icecream-$pkgver"
	python setup.py test
}

package() {
	export PYTHONHASHSEED=0
	cd "icecream-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
