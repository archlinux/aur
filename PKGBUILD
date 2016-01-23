# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-ujson
pkgver=1.35
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="Ultra fast JSON encoder and decoder for Python."
url="https://github.com/esnme/ultrajson"
license=('BSD')
arch=('i686' 'x86_64')
depends=('python')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz LICENSE.txt)

build() {
	cd "$srcdir/$_libname-$pkgver"
	sed 's|shutil.rmtree|pass #|' -i setup.py
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86'
            '45b0247dc589415c76f5e2055bfa073f673870e9eb0b4177cc3c642efb434559')
