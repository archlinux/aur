# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=python-importmagic
_pkg="${pkgname#python-}"
pkgver=0.1.7
pkgrel=2
pkgdesc="Automatically manage imports in Python"
arch=('any')
url="https://github.com/alecthomas/importmagic"
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGES
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bf261beebcd04c848db03ca997a4395a67987e7a5b3e2efbe504ce162ce1393a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_pkg-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
