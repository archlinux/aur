# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-pyrad
_pkg="${pkgname#python-}"
pkgver=2.5.4
pkgrel=1
pkgdesc="Python RADIUS Implementation"
arch=('any')
url='https://github.com/pyradius/pyrad'
license=('BSD-3-Clause')
depends=('python-netaddr')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf09419ce0e191a154d'
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
