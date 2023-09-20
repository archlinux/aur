# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-storage
pkgname=python-google-cloud-storage
pkgver=2.11.0
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
b2sums=(72c0190691476583b332505b3d9fd9a2126bd289c1d0689057c2b20424879b2707358654c9daab879d4d007bdcae70cb1152372618993276726e74f404e2e6d2)

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

  install -Dm644 SECURITY.md -t "${pkgdir}"/usr/share/doc/${pkgname}/
  install -Dm644 docs/build/google-cloud-storage.1 -t "${pkgdir}"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
