# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=find_libpython
pkgname=python-$_pkgname
pkgver=0.4.1
pkgrel=2
pkgdesc="Finds the libpython associated with the current Python environment, wherever it may be hiding"
arch=(any)
url="https://github.com/ktbarrett/find_libpython"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
options=(!emptydirs)
install=
source=("https://github.com/ktbarrett/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('43410201ffdc681aabec501e97a50e989556558cd0f63ef3775e1fb585a96e151aaa7e97132a981b0a8857e99a4d4bb1215ec0f6868770b649d260486d1194a5')

prepare() {
	echo "Version: $pkgver" > "$_pkgname-$pkgver/PKG-INFO"
}

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
