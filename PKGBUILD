# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-storage
pkgname=python-google-cloud-storage
pkgver=2.17.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=(any)
url=https://github.com/googleapis/python-storage
license=(Apache)
depends=(
  python-google-api-core
  python-google-auth
  python-google-cloud-core
  python-google-resumable-media
  python-requests
)
optdepends=(python-protobuf)
makedepends=(
  python-build
  python-installer
  python-recommonmark
  python-setuptools
  python-sphinx
  python-wheel
)
# checkdepends=(
#   python-google-cloud-testutils
#   python-mock
#   python-pytest-runner
#)
changelog=CHANGELOG.md
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=(6e477c1eaebe32e899997d64ebddc0030bff4f8b6af6ec8c00e0a0fcfb81a04a1b3710f9fd6028c3ea8aca8051d0f1f3727f9e36739a65ff30cec819334a5381)

build() {
  cd ${_pkgname}-${pkgver}
  python \
    -m build \
    --wheel \
    --no-isolation
  PYTHONPATH="${PWD}" sphinx-build -b man docs/ docs/build
}

## tests require set environment variables
# check() {
#   cd ${_pkgname}-${pkgver}
#   python setup.py pytest
# }

package() {
  cd ${_pkgname}-${pkgver}
  python \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} SECURITY.md
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 docs/build/google-cloud-storage.1
}

# vim: ts=2 sw=2 et:
