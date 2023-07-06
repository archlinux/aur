# Maintainer: Brody <archfan at brodix dot de>

_pkgname=python-storage
pkgname=python-google-cloud-storage
pkgver=2.10.0
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
b2sums=(4c763dd249dd568a0b45d7ebc22c0c7afcdf6ecb4ebf5ac141c7c3c3be8af482ed58bf4d18540654e85a16a8efd62eb625ef0058d920bf2998ac97f6d248374a)

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
# 	python setup.py pytest
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
