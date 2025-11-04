# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='rapidtables'
pkgname="python-$_projectname"
pkgver='0.1.12'
_commit='b38275878fc7e3519259034d49bfd46910c459ce'
pkgrel='1'
pkgdesc='Super fast list of dicts to pre-formatted tables conversion library'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-termcolor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('b1ec689dcad015f38e0642914574f62c46df030fec276788b0498388ec5a53eadab4c2473f68b5dafba341d00f88872df8f1fe9c73c4f592e92271227f375eb3')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(python -B 'examples/example.py')"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^John     2000  DevOps'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
