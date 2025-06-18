# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-storage
pkgname=python-google-cloud-storage
pkgver=3.1.1
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=(any)
url=https://github.com/googleapis/python-storage
license=(Apache-2.0)
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
b2sums=('7a7d32bfb788c4cb019c5ed0d0adcc748dc3379c2216592902ad779f9b867ece7b2d6f4231babef57131ebf9984f5aad635e51a43836e81f684bd0ebc038b934')

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

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    SECURITY.md
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 \
    docs/build/google-cloud-storage.1
}

# vim: ts=2 sw=2 et:
