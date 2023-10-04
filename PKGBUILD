# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-cloudpathlib
_pkg="${pkgname#python-}"
pkgver=0.15.1
pkgrel=1
pkgdesc="Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage."
url="https://github.com/drivendataorg/cloudpathlib"
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
license=('MIT')
arch=(any)
source=("$pkgname-$pkgver.tar.gz::https://github.com/drivendataorg/$_pkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("52deb1803ea585a60917cebdb28e18151d0b998c0f2897a53b32c697be4a51c8")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
