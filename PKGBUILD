# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib
pkgver=1.0.1
pkgrel=2
pkgdesc="Netcat as a library: convienent socket interfaces"
license=('MIT')
arch=('any')
url="https://pypi.python.org/pypi/nclib"
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/nclib/nclib-$pkgver.tar.gz"
        "LICENSE::https://github.com/rhelmot/nclib/raw/release/stable/LICENSE")
sha256sums=('9d41adb7df01a3fead10bc9698a175936b263d6bd18997078ed17e4fa61734d1'
            '72e0913251cf7d16cc7ee6ff3d0e97631414c4777b46531c8a53328da4ab8df4')

build() {
	cd "nclib-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "nclib-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
