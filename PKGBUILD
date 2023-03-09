# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pyrad
_pkg="${pkgname#python-}"
pkgver=2.4
pkgrel=1
pkgdesc="Python RADIUS Implementation"
arch=('any')
url='https://github.com/pyradius/pyrad'
license=('BSD')
depends=('python-netaddr' 'python-six')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9'
            '998e0422ba4ca1519d7d61959e00b9eb8377253b00808b3bafdc85628d2be2b8')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dvm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
