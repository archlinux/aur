# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-zimports
pkgver=0.4.3
pkgrel=1
pkgdesc="Python import rewriter"
arch=('any')
url="https://github.com/sqlalchemyorg/zimports"
license=('MIT')
depends=('python>=3.7' 'python-pyflakes' 'python-flake8-import-order')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b3605efb2849f932d923857bc7ec59065c068269c1816a8c326c0fe3187fcd37')

build() {
	cd "zimports-$pkgver"
	python setup.py build
}

package() {
	export PYTHONHASHSEED=0
	cd "zimports-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
