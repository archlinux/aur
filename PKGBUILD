# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-debmutate
pkgver=0.47
pkgrel=1
pkgdesc="Format-preserving manipulation of Debian control files in Python"
arch=('any')
url="https://salsa.debian.org/jelmer/debmutate"
license=('GPL2')
depends=('python-debian' 'python-merge3' 'python-tr')
makedepends=('python-setuptools')
optdepends=('python-semver' 'python-tomlkit')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/debmutate-$pkgver.tar.gz")
sha256sums=('23d5107a9b97e3782ff2e300348c492375d607e72e8a41ba64dc58e0038b4bf9')

build() {
	cd "debmutate-$pkgver"
	python setup.py build
}

check() {
	cd "debmutate-$pkgver"
	python setup.py test
}

package() {
	export PYTHONHASHSEED=0
	cd "debmutate-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
