# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-wbdata
_pkg="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc='A library to access World Bank data'
arch=('any')
url='https://github.com/oliversherouse/wbdata'
license=('GPL-2.0-or-later')
depends=('python' 'python-requests' 'python-tabulate' 'python-appdirs' 'python-cachetools' 'python-shelved-cache' 'python-backoff' 'python-dateparser' 'python-decorator')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry')
optdepends=('python-pandas' 'mkdocs' 'mkdocstrings')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fc54ab8199712ade436ec9f6c38c5cadb87883ef465561f178489bc8034c2d94deea1c8626760a2c3986835334c8a7c0d011f32ac6053c592fbee35d0963dc94')

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
