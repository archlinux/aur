# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.9
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-setuptools')
makedepends=('git')
checkdepends=('python-testtools')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cc68b574c20676187688a31415a16b3bba7ba2e9ab7e6747255bf17767ab5ac2')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python setup.py test
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Remove Debian-specific binary
	rm "$pkgdir/usr/bin/deb-fix-build"
}
