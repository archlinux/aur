# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=0.4.2
pkgrel=3
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
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/explosion/weasel/releases/download/release-v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("447a5f7b99f8002c4c5ed076ecf75f23e9ad3f7c4be05d3930c7d087721674fd")

build() {
    cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
