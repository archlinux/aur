# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-wbdata
_pkg="${pkgname#python-}"
pkgver=1.0.0
pkgrel=2
pkgdesc='A library to access World Bank data'
arch=('any')
url='https://github.com/oliversherouse/wbdata'
license=('GPL-2.0-or-later')
depends=('python' 'python-requests' 'python-tabulate' 'python-appdirs' 'python-cachetools' 'python-shelved-cache' 'python-backoff' 'python-dateparser' 'python-decorator')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
optdepends=('python-pandas' 'mkdocs' 'mkdocstrings')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df9044539f3c8747ab5ca94ae5c56674b8547417e8c47e515bf14efc57e29beb')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
