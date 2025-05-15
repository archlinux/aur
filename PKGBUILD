# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-cloudpathlib
_pkg="${pkgname#python-}"
pkgver=0.21.1
pkgrel=1
pkgdesc="Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage."
url="https://github.com/drivendataorg/cloudpathlib"
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
    'python-flit-core')
license=('MIT')
arch=(any)
source=("$pkgname-$pkgver.tar.gz::https://github.com/drivendataorg/$_pkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("170232de16d29b9a82d21471106c56bd0dc579dc26d67ae460d75be92bcc3bda")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
