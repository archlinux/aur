# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='neotermcolor'
pkgname="python-$_projectname"
pkgver='2.0.10'
_commit='f4993d2590a2bfe6d89d075a38ede39e7dd0b896'
pkgrel='4'
pkgdesc='Modern ANSII Color formatting for output in terminal'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('5b8804f47783cdf7d8d5729fab3f4e5c5b99b64a7395b708ca0c4a1aadc477b334c18cf174203afddca9e5d2166e0337c0723178f7dd64e50f3ee37cb1d22d21')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python test.py
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
