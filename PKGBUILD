# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-unp
pkgver=0.3
pkgrel=3
pkgdesc='Command line tool for unpacking archives'
arch=('any')
url='https://github.com/mitsuhiko/unp'
license=('BSD')
depends=('python-click')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('unp')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/unp/unp-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('234807c6db6f802cf25509dd495f7978516f1d04eecd6f0acfef0ac76cba6009'
            'ca5da925ab8f92d6902170575b9298db099d92060a12af203d409b8d41145a6e')

build() {
	cd "unp-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "unp-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
