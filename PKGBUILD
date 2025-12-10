# Maintainer: Arturo Penen <apenen at gmail dot com>

_pkgname=google-cloud-container
pkgname=python-google-cloud-container
pkgver=2.61.0
pkgrel=1
pkgdesc='Google Cloud Container API client library'
arch=(any)
url=https://github.com/googleapis/google-cloud-python
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
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${_pkgname}-v${pkgver}.tar.gz)
sha256sums=(259ad73af85c4f6c14fc5607fa7427cda5a78c0fc0a0d3be86c418010beb6cd4)

build() {
  cd google-cloud-python-${_pkgname}-v${pkgver}/packages/google-cloud-container/
  python \
    -m build \
    --wheel \
    --no-isolation
  PYTHONPATH="${PWD}" sphinx-build -b man docs/ docs/build
}

package() {
  cd google-cloud-python-${_pkgname}-v${pkgver}/packages/google-cloud-container/
  python \
    -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  #install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} SECURITY.md
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 docs/build/google-cloud-container.1
}

# vim: ts=2 sw=2 et:
