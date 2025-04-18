# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: neodarz <neodarz at neodarz dot net>

_pkgname=eradicate
pkgname=python-$_pkgname

pkgver=2.3.0
pkgrel=1
pkgdesc="Removes commented-out code from Python files"
url='https://github.com/PyCQA/eradicate'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b31f59b5785aa57fa55c329bfce430e8ade5de870bbe99585ff59e68fdd33bb312e49ecd72873780e47e09f713ebbaa929bd6981bf2800f858def80a9c03a8ec')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"
	python -m unittest discover -v
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
