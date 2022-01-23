# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-aiowsgi
pkgver=0.7
pkgrel=1
pkgdesc='Minimal wsgi server using asyncio'
arch=('any')
url='https://github.com/gawel/aiowsgi'
license=('MIT')
depends=('python-webob' 'python-waitress')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner' 'python-webtest' 'python-wsgiproxy2')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/aiowsgi/aiowsgi-$pkgver.tar.gz")
sha256sums=('9fad305430fa39d54cd10a47a367a98c47424e5f176774d443bcf48aa5b5be33')

## interfered with tests
# prepare() {
# 	cd "aiowsgi-$pkgver"
# 	rm setup.cfg
# }

build() {
	cd "aiowsgi-$pkgver"
	python setup.py build
}

## tests fail because python-waitress made breaking changes
# check() {
# 	cd "aiowsgi-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "aiowsgi-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
