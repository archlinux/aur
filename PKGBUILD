# Contributor: Arturo Penen <apenen@gmail.com>

_name=grpc_google_iam_v1
pkgname=python-grpc-google-iam-v1
pkgver=0.14.4
pkgrel=1
pkgdesc="gRPC Google IAM python"
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/grpc-google-iam-v1"
arch=(any)
license=(Apache-2.0)
depends=(python-grpcio python-protobuf python-googleapis-common-protos)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "fix-deprecations.patch")
sha256sums=('392b3796947ed6334e61171d9ab06bf7eb357f554e5fc7556ad7aab6d0e17038'
            '24c6ee7713ef1024df49503e61c241ad2d1c1ce23784112e35884d652b152b63')

prepare() {
  cd "$_name-$pkgver"
  patch -p1 < ../fix-deprecations.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ts=2 sw=2 et:
