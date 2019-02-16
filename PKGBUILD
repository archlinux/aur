# Maintainer: Tommy Li <ttoo74@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-oauthlib2
pkgname=(python-oauthlib2 python2-oauthlib2)
pkgver=2.1.0
pkgrel=1
_libname=oauthlib
pkgdesc="A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
arch=(any)
url="https://github.com/idan/oauthlib"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
makedepends=(python-setuptools python2-setuptools)
sha256sums=('ac35665a61c1685c56336bda97d5eefa246f1202618a1d6f34fccb1bdd404162')

build() {
	cd "$srcdir/$_libname-$pkgver"

	rm -rf ../buildpy3; mkdir ../buildpy3
	python setup.py build -b ../buildpy3

	rm -rf ../buildpy2; mkdir ../buildpy2
	python2 setup.py build -b ../buildpy2
}

package_python-oauthlib2() {
	depends=(python-cryptography)
	conflicts=(python-oauthlib)

	cd "$srcdir/$_libname-$pkgver"
	rm -rf build; ln -s ../buildpy3 build
	python setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	chmod -R a+r "$pkgdir/usr/lib"
}

package_python2-oauthlib2() {
	depends=(python2-cryptography)
	conflicts=(python2-oauthlib)

	cd "$srcdir/$_libname-$pkgver"
	rm -rf build; ln -s ../buildpy2 build
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	chmod -R a+r "$pkgdir/usr/lib"
}
