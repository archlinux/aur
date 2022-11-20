# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python38-iso8601
_libname=iso8601
pkgver=1.1.0
pkgrel=2
pkgdesc="Simple module to parse ISO 8601 dates"
arch=(any)
url="https://pyiso8601.readthedocs.io/en/latest/"
license=('MIT')
depends=(python38)
makedepends=(python38-poetry-core python38-setuptools python38-wheel python38-build python38-installer)
checkdepends=(python38-pytest python38-hypothesis python38-pytz)
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
sha256sums=('32811e7b81deee2063ea6d2e94f8819a86d1f3811e49d23623a41fa832bef03f')


build() {
    cd "$srcdir"/iso8601-$pkgver
    python3.8 -m build --wheel --no-isolation
}

check() {
    cd "$srcdir"/iso8601-$pkgver
    python3.8 -m pytest .
}

package() {
    cd "$srcdir"/iso8601-$pkgver
    python3.8 -m installer --destdir="$pkgdir" dist/*.whl
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
