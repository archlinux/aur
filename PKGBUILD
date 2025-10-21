# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-google-cloud-resource-manager
_pkgname=${pkgname#python-}
pkgver=1.15.0
pkgrel=1
pkgdesc="Google Cloud Resource Manager API client library"
arch=(any)
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-resource-manager'
license=(Apache-2.0)
makedepends=(
  python-build
  python-installer
  python-wheel
)
depends=(
  python
  python-google-api-core
  python-grpc-google-iam-v1
  python-proto-plus
  python-protobuf
  python-google-auth
  python-googleapis-common-protos
  python-requests
  python-grpcio
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('3d0b78c3daa713f956d24e525b35e9e9a76d597c438837171304d431084cedaf')

_archive="google_cloud_resource_manager-${pkgver}"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
