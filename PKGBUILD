# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=0.4.3
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
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/explosion/weasel/releases/download/release-v$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("f293d6174398e8f478c78481e00c503ee4b82ea7a3e6d0d6a01e46a6b1396845")

build() {
    cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
