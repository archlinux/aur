# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_core
pkgname=python-google-cloud-core
pkgver=2.5.0
pkgrel=1
pkgdesc='Google Cloud API client core library'
url=https://github.com/googleapis/python-cloud-core
arch=(any)
license=(Apache-2.0)
depends=(
  python
  python-google-api-core
  python-google-auth
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=('python-grpcio: for grpc support')
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz)
b2sums=('f9588c4febd3c51cc71fa96827787fcc2a1990a306921debd119a891fcde74b2a1b45a4a5732cf11f50d14780f2d9344e42ac2b8f21260fe4b2c966161d6530e')

build() {
  cd ${_pyname}-${pkgver}

  python -m build \
    --wheel \
    --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} README.rst
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE
}

# vim: ts=2 sw=2 et:
