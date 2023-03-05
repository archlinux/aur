# Maintainer: Sean Anderson <seanga2@gmail.com>
_pkgname=find_libpython
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc="Finds the libpython associated with the current Python environment, wherever it may be hiding"
arch=(any)
url="https://github.com/ktbarrett/find_libpython"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
install=
source=("https://github.com/ktbarrett/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0ae368607b2ebac1be239e95f33b53600748e2cdf9fd864b81228d3690ae9ea781045eca16df45bf66956539c0af80b781fd6eff343742dd20767b722f4b82d8')

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
