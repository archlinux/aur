# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=0.4.2
pkgrel=1
pkgdesc="A small and easy workflow system"
url="https://github.com/explosion/weasel/"
depends=(
    'python-confection'
    'python-wasabi'
    'python-srsly'
    'python-typer'
    'python-cloudpathlib'
    'python-smart_open'
    'python-requests'
    'python-pydantic')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
license=('MIT')
arch=(any)
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/weasel/releases/download/release-v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("06694db751b5d0d5e8bab3d2ccc0dbb72cf623522b52c6b7a0cdfe9d94bbfd8b")

build() {
    cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
