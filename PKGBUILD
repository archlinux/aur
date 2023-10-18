# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=python-ctypesgen
pkgver=1.1.1
pkgrel=1
pkgdesc="Pure-python wrapper generator for ctypes"
arch=(any)
url="https://github.com/ctypesgen/ctypesgen"
license=('BSD')
depends=('python>=3.7.0')
makedepends=('python-setuptools>=44.0.0' 'python-installer' 'python-wheel' 'python-setuptools-scm>=3.4.3' 'python-build' 'python-toml')
checkdepends=('python-pytest')
changelog=$pkgname.changelog.md
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("deaa2d64a95d90196a2e8a689cf9b952be6f3366f81e835245354bf9dbac92f6")

build() {
	cd "$_name-$pkgver/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver/"
	pytest tests/testsuite.py
}

package() {
	cd "$_name-$pkgver/"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
