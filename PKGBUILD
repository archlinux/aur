# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-tinyec
_name="${pkgname#python-}"
pkgver=0.4.0
pkgrel=1
pkgdesc="Tiny library to perform arithmetic operations on elliptic curves"
arch=('any')
url="https://github.com/alexmgr/tinyec"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose')
install=tinyec.install
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b0364aab3b9af632b64f24eafae0c8e56cc64b4845648752610f48f2ab0547a3')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"
	nosetests
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
