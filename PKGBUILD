# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-ujson
pkgver=1.33
pkgrel=2
_libname=${pkgname/python2-/}
pkgdesc="Ultra fast JSON encoder and decoder for Python."
url="https://github.com/esnme/ultrajson"
license=('BSD')
arch=('i686' 'x86_64')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip LICENSE.txt)

build() {
	cd "$srcdir/$_libname-$pkgver"
	sed 's|shutil.rmtree|pass #|' -i setup.py
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -m0644 -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('68cf825f227c82e1ac61e423cfcad923ff734c27b5bdd7174495d162c42c602b'
            '45b0247dc589415c76f5e2055bfa073f673870e9eb0b4177cc3c642efb434559')
