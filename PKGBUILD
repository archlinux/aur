# Maintainer: Joel Jensen <yobert@gmail.com>

_pkgname=google_cloud_secret_manager
pkgname=python-google-cloud-secret-manager
pkgver=2.31.0
pkgrel=1
pkgdesc="Google Cloud Secret Manager API client library"
arch=('any')
url="https://github.com/googleapis/google-cloud-python"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'python-google-api-core>=2.28.0'
    'python-google-auth>=2.14.1'
    'python-googleapis-common-protos'
    'python-grpc-google-iam-v1>=0.14.2'
    'python-grpcio>=1.75.1'
    'python-proto-plus>=1.27.1'  # older versions break with protobuf 7
    'python-protobuf>=33.5'      # protobuf release 33.5 == python protobuf 6.33.5
    'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('29bb33b48c3b974495a4d015e06b06b126e23232bccd223d678da1e1a861b6e6')

prepare() {
    cd "${_pkgname}-${pkgver}"
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest --noconftest -v
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

