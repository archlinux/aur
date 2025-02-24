# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_core
pkgname=python-google-cloud-core
pkgver=2.4.2
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
b2sums=('cf173fab5d094ca9e2dc709cd7fcf14129015ac502f873eb55ddb02cfbc37194762bb2961924e7166c0a58d242abd737798c10e31697c6484e281b0b86066685')

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
