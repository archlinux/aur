# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='rapidtables'
pkgname="python-$_projectname"
pkgver='0.1.11'
_commit='da2737da6c210518e3044782d72de031c53d9a7e'
pkgrel='6'
pkgdesc='Super fast list of dicts to pre-formatted tables conversion library'
arch=('any')
url="https://github.com/alttch/$_projectname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-termcolor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
b2sums=('b198b723f24884cae5a303171f880c29410e72e25a3431ddfbb2992d39a5aafbed9f8a7ed5fd923f6793da7cff37426410f87cb98fc033d9a27dd56858ec3e8a')

_sourcedirectory="$_projectname-$_commit"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	_checkoutput="$(python -B 'examples/example.py')"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q '^John     2000  DevOps'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
