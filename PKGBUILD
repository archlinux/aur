# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: jyantis <yantis@yantis.net>

pkgname=python-chess-git
_pkg="${pkgname%-git}"
pkgver=1.9.2.r17.g9d68cef4
pkgrel=1
pkgdesc="Chess library with move generation/validation and common format support"
arch=('any')
url=https://github.com/niklasf/python-chess
license=('GPL3')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$_pkg"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg"
	python test.py
}

package() {
	cd "$_pkg"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
