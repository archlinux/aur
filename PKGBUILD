# Contributor: Arturo Penen <apenen@gmail.com>

_name=grpc_google_iam_v1
pkgname=python-grpc-google-iam-v1
pkgver=0.14.5
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
sha256sums=('07fd3a9fafb586588e771831fbfc8f6597050181d0c3b45e039d18b8fdc1aab5'
            '3ae94d82120928d8da22cbbdb129480ebea8d8a66de884af944cdc87eefc583b')

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
