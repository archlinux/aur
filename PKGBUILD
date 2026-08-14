# Maintainer: a821 (nospam) mail de
# Contributor: Vekhir <vekhir at yahoo dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
_pkg="${pkgname#python-}"
pkgver=2.3.7
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache-2.0')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('608ad096772e8a16097beab9ce14d7f10837d0bfcca0c691f193636af903eab2d928d31a96915c66fe549e6669b550320fa76b3a351b81f15e59711f4baffb03')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i "/packages=/s/()/(exclude=['tests*'])/" setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
