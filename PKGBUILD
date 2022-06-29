# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: qlonik <volodin.n at gmail dot com>

pkgname=python-meteor-ejson
_pkg="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc="Encoder and Decoder for Extended JSON (EJSON)"
url="https://github.com/lyschoening/meteor-ejson-python"
license=('MIT')
arch=('any')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c160a043a44f42ac8c0fdff46b3369c1b087484b53d973ed8d5e5a5d47e9edf2')

build() {
	cd "$_pkg-python-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-python-$pkgver"
	nosetests
}

package() {
	cd "$_pkg-python-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
