# Maintainer: Brody <archfan at brodix dot de>

_pyname=google-cloud-core
pkgname=python-google-cloud-core
pkgver=2.3.3
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
b2sums=(1dc72fab3d63577d29d30bbbc6887adc4fda0825f1ece59b384c647ba2df48e4c9d43021f8248eb8328c8f921cda8e1a40f1b85392bf9408bbbe759fad50d9a7)

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
