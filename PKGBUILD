# Contributor: Arturo Penen <apenen@gmail.com>

_name=grpc_google_iam_v1
pkgname=python-grpc-google-iam-v1
pkgver=0.14.6
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
sha256sums=('fc0a683ace0a149184fcd08d667dd64d51ae65e5698e86f7136aa6002a8b5373'
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
