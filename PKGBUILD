# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-uploadserver
_pkg=uploadserver
pkgver=6.0.0
pkgrel=1
pkgdesc='Python http.server extended to include a file upload page'
arch=('any')
license=('MIT')
url="https://github.com/Densaugeo/uploadserver"
depends=('python-requests' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha512sums=('615f155b60e83974ac2c83f369f9673969a0b369e5b2583a681311fc039e4aff125b5b4803d94d0fabeaaae40fad1f8164bc872f7fecc732f67d799daf4eb614')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
