# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: portaloffreedom

pkgname=python-pyjokes
_pkg="${pkgname#python-}"
pkgver=0.6.0
pkgrel=3
pkgdesc="One line jokes for programmers (jokes as a service)"
url="https://github.com/pyjokes/pyjokes"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a6d06a5428dd8f316a3f8784cac0180067b6530121d9cf3976d5f903db264c86')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENCE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
