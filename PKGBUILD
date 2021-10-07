# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.8.2
pkgrel=1
pkgdesc="scruffy: boilerplate janitor for Python"
arch=('any')
url="https://github.com/snare/scruffy"
license=('MIT')
depends=('python-six>=1.10.0' 'python-yaml>=3.11')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('36bd10f44a5329590e4ea7a6746645c1f9fa05d03b62c8c713676c65dbff2392')

build() {
	cd "scruffy-$pkgver"
	python setup.py build
	cd doc
	make man
}

check() {
	cd "scruffy-$pkgver"
	nosetests
}

package() {
	cd "scruffy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 doc/_build/man/scruffy.1 -t "$pkgdir/usr/share/man/man1/"
}
