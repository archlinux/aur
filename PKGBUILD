# Maintainer: a821 (nospam) mail de
# Contributor: Vekhir <vekhir at yahoo dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
_pkg="${pkgname#python-}"
pkgver=2.2.20
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache-2.0')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('31286bd114324de719a2232914bec5d697815e9bce12939514938f2786fed5715b5e875610716ba26b73d609330e55862266f848c7f919ec8bf49941f9d04369')

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
