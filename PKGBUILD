# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Masoud <mpoloton@gmail.com>

pkgname=python-gimmik
_pkg="${pkgname#python-}"
pkgver=3.0
pkgrel=1
pkgdesc='Generator of Matrix Multiplication Kernels'
arch=('any')
url="https://github.com/pyfr/gimmik"
license=('BSD')
depends=('python>=3.9' 'python-numpy' 'python-mako')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('45c2da7acff3201b7796ba731e4be7f3b4f39469ff1f1bc0ddf4f19c4a6af010')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/AUTHORS" "$pkgdir/usr/share/doc/$pkgname/"
}
