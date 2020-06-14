# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_projectname='pysha3'
pkgname="python2-$_projectname"
pkgver='1.0.2'
pkgrel='2'
pkgdesc='Backport of hashlib.sha3 for Python 2.7 to 3.5 - python2 version'
arch=('any')
url="https://github.com/tiran/$_projectname"
license=('PSF')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b7691514fdb389037d3428bc4e7764715805ff829419aaa7f8bd09215e22e5d5')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	find . -type f -exec sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2.7|g' {} \;
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
