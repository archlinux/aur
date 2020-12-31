# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-hyper
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="HTTP/2 for Python."
arch=('any')
url="http://hyper.rtfd.org"
license=('MIT')
depends=('python-h2' 'python-hyperframe')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
sha256sums=('12c82eacd122a659673484c1ea0d34576430afbe5aa6b8f63fe37fcb06a2458c'
            'SKIP')
validpgpkeys=('90DCAE40FEA74B149B70662DF25F2144EEC1373D') # Cory Benfield (Personal Mail) <cory@lukasa.co.uk>

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
