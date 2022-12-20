# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='imgsize'
pkgname="python-$_projectname"
pkgver='2.1'
pkgrel='6'
pkgdesc='Pure Python image size library'
arch=('any')
url="https://github.com/ojii/$_projectname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d5f252aeab363a6fcc837550e742c29707b141c55d615161a540b22e805a3a4f5babce490a43208e7f2a03f79d17fb7c357039790ca3922d63e44532ca1a37f3')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python -m unittest discover --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
