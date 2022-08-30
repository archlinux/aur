# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Manolo Martínez <manolo@austrohungaro.com>

pkgname=python-stagger-git
_pkg=stagger
pkgver=1.0.0.r8.g6530db1
pkgrel=1
pkgdesc="ID3v1/ID3v2 tag manipulation package in pure Python 3"
arch=('any')
url="https://github.com/staggerpkg/stagger"
license=('BSD')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('python-stagger')
conflicts=('python3-stagger-svn')
source=("$_pkg::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^release-//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
