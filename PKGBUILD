# Maintainer: Brody <archfan at brodix dot de>

_pyname=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.4.1
pkgrel=1
pkgdesc='Google Cloud API client core library'
url=https://github.com/googleapis/python-cloud-core
arch=(any)
license=(APACHE)
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
b2sums=(7c92684114b2977035b93758876ee3c4373c98e80a6db7e6031c75ae1b6276a109e6fcae5a21811a3652b9344b681fa0e38383f0f5d5ca1d6d9a4f1d94b43e8e)

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

  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/${pkgname}/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 et:
