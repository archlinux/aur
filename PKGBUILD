# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-cloudpathlib
_pkg="${pkgname#python-}"
pkgver=0.19.0
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
sha256sums=("602777e064cb4112b059dad1bdfb99403dd93cf36d1484cce747d5332ce95b07")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
