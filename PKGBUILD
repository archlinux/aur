# Contributor: Arturo Penen <apenen@gmail.com>

_name=grpc_google_iam_v1
pkgname=python-grpc-google-iam-v1
pkgver=0.14.3
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
sha256sums=('879ac4ef33136c5491a6300e27575a9ec760f6cdf9a2518798c1b8977a5dc389'
            'b706d64061435bbe91080101b0522b0b07b408d9a1f3e3268b512a7afe316e55')

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
