# Maintainer: Brody <archfan at brodix dot de>

_pyname=google_cloud_core
pkgname=python-google-cloud-core
pkgver=2.4.3
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
b2sums=('92a9dde0cf8b443af9954927e442e8af9a13e9498d19e47657f011e76d0b1f306b5813d525d52a32a0c90271541f968b033afeb51a3d900a037dca75f7c86f37')

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
