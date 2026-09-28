# Maintainer: a821 (nospam) mail de
# Contributor: Vekhir <vekhir at yahoo dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
_pkg="${pkgname#python-}"
pkgver=2.3.12
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache-2.0')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('076c1d9cec90bbb1bc3d289f7c9ed4ed96afe574c7fbb1e43220782fea180937746394ef327c05d6c05e93475f45343f590a9cd9b7daa6ec418667fc1fca07dc')

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
