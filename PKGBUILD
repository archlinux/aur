# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=0.3.3
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/$_pkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8dc969764bd61899bd494b4d195bf781d9018efeacfadbe87df630f78e313f96")

build() {
    cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
