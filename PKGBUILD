# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
_projectname='soupsieve'
pkgname="python2-$_projectname"
pkgver='1.9.6'
pkgrel='3'
pkgdesc='A CSS4 selector implementation for Beautiful Soup - python2 version'
arch=('any')
url="https://github.com/facelessuser/$_projectname"
license=('MIT')
depends=('python2-backports.functools_lru_cache')
makedepends=('python2-setuptools')
# checkdepends=('python2-pytest' 'python2-beautifulsoup4' 'python2-html5lib' 'python2-lxml')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facelessuser/$_projectname/archive/$pkgver.tar.gz")
sha256sums=('3fc0bf362090cfafb0b592b120c289d72b11ddab3717015a7a327e30e23e7f65')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

# circular dependency on python2-lxml
# check() {
# 	cd "$srcdir/$_sourcedirectory/build/"
# 	py.test2
# }

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1

	install -Dm644 'LICENSE.md' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
