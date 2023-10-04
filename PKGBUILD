# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=0.3.1
pkgrel=1
pkgdesc="A small and easy workflow system"
url="https://github.com/explosion/weasel/"
depends=(
    'python-confection'
    'python-wasabi'
    'python-srsly'
    'python-typer'
    'python-cloudpathlib'
    'python-smart-open'
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
sha256sums=("f6921ebc14b900ae087eb5981a30d1ef3f5c154a57faf6849023c4a148b76406")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
