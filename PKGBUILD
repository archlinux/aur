# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-cloudpathlib
_pkg="${pkgname#python-}"
pkgver=0.23.0
pkgrel=1
pkgdesc="Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage."
url="https://github.com/drivendataorg/cloudpathlib"
depends=('python-typing_extensions' 'python-pydantic-core' 'python-importlib-metadata')
optdepends=('python-google-auth' 'python-boto3')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
    'python-flit-core')
license=('MIT')
arch=(any)
source=("$pkgname-$pkgver.tar.gz::https://github.com/drivendataorg/$_pkg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("836857d6d4c80461b8a7bcde2f601ef3bc865d62892cf84972b3fcf38f7af996")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
