# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pygelf'
pkgname="python-$_projectname"
pkgver='0.4.3'
_commit='986e6cf34969379a947853b12d9dd49c53fb7eae'
pkgrel='1'
pkgdesc='Python logging handlers with GELF (Graylog Extended Log Format) support'
arch=('any')
url="https://github.com/keeprocking/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('9aa47e2c15fbad0523a7af933b791ecbc68a5069b69c4e3b8257f28ac7c973c4dd2c7e0ed172290ece9de2ea75630a8e2a90c5cc4664fb28217df8ca250dc937')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

# Not running tests because they require a running Graylog instance

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
