# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.7+2+gdcf1a00
pkgrel=2
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-setuptools')
makedepends=('git')
checkdepends=('python-testtools')
#source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
_commit=dcf1a0079d40a261beb5fd738d56c151cbc4d7ef
source=("git+https://github.com/jelmer/ognibuild.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
#	cd "$pkgname-$pkgver"
	cd "$srcdir/$pkgname"
	python setup.py build
}

check() {
#	cd "$pkgname-$pkgver"
	cd "$srcdir/$pkgname"
	python setup.py test
}

package() {
#	cd "$pkgname-$pkgver"
	cd "$srcdir/$pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	# Remove Debian-specific binary
	rm "$pkgdir/usr/bin/deb-fix-build"
}
