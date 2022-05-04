# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jonas Schürmann <jonasschuermann@aol.de>

pkgname=python-signalslot
_pkg="${pkgname#python-}"
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple Signal/Slot implementation"
url="https://github.com/numergy/signalslot"
license=('MIT')
arch=('any')
depends=('python-contexter' 'python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6c29702b7957f8ba65ade2810bb7509d7bc90aa66b3b9693a575b3b992f6340f')

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
