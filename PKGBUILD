# Maintainer: piernov <piernov@piernov.org>

pkgname=python-chirpstack-api
pkgver=4.13.0
pkgrel=1
pkgdesc="ChirpStack gRPC API message and service wrappers for Python"
arch=('any')
url="https://pypi.org/project/chirpstack-api/"
license=('MIT')
depends=('python' 'python-grpcio' 'python-google-api-core')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-grpcio-tools')
source=("https://github.com/chirpstack/chirpstack/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1aff2a683e8766ccdbe7e80629153d6c')

build() {
  cd "${srcdir}"/chirpstack-${pkgver}/api/python
  # "all" target depends on "requirements" target which runs `pip install` which we do not want
  # So call all the other targets manually
  make pre-build common gw api integration stream
  cd src
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/chirpstack-${pkgver}/api/python/src
  python -m installer --destdir="$pkgdir" dist/*.whl
}
