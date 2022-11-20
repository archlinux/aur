# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python38-rsa
pkgver=4.9
pkgrel=1
_libname=rsa
pkgdesc="Pure-Python RSA implementation"
arch=(any)
url="https://github.com/sybrenstuvel/python-rsa/"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
depends=(python38-pyasn1)
makedepends=(python38-setuptools)
sha256sums=('e38464a49c6c85d7f1351b0126661487a7e0a14a50f1675ec50eb34d4f20ef21')

build() {
	cd "$srcdir/$_libname-$pkgver"

	rm -rf ../buildpy3; mkdir ../buildpy3
	python3.8 setup.py build -b ../buildpy3
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	#cd "$srcdir/sybren-python-rsa-8f50f506b4a2"
	rm -rf build; ln -s ../buildpy3 build
	python3.8 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
