# Contributor: Vladimir Keleshev <vladimir [at] keleshev [dot] com>
# Maintainer: ???

_name=schema
pkgbase="python-$_name"
pkgname=("python2-$_name" "python-$_name")
pkgver=0.6.6
pkgrel=1
pkgdesc='Python module to validate and convert data structures.'
arch=('any')
url="https://github.com/keleshev/$_name"
license=('MIT')
makedepends=('python-setuptools'  'python-pytest'
            'python2-setuptools' 'python2-pytest')
source=("https://github.com/keleshev/$_name/archive/v$pkgver.tar.gz")
sha1sums=('fad10e26ba7bb28ec0d0e57f4410882dc357ab63')

check() {
	cd "$_name-$pkgver"
	python2 setup.py test
	python setup.py test
}

do_package() {
	depends=("$1")
	cd "$srcdir/$_name-$pkgver"
	"$1" setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

package_python2-schema() {
	do_package python2
}

package_python-schema() {
	do_package python
}
