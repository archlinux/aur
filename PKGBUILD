# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
_projectname='cssselect'
pkgname="python2-$_projectname"
pkgver='1.1.0'
pkgrel='8'
pkgdesc='A Python library that parses CSS3 Selectors and translates them to XPath 1.0 - python2 version'
arch=('any')
url="https://pypi.python.org/pypi/$_projectname"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
# checkdepends=('python2-lxml' 'python2-pytest-runner')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/scrapy/$_projectname/archive/v$pkgver.tar.gz")
sha256sums=('dde8c1d4a2c82de6889a3af1c1adbce1a6f3ec08b07a854d873f3f3da92960af')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

# circular dependency on python2-lxml
# check() {
# 	cd "$srcdir/$_sourcedirectory/"
# 	python2 setup.py pytest
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
