# Maintainer: Brody <archfan at brodix dot de>

_reponame=google-cloud-python
pkgname=python-google-cloud-core
_pkgname=${pkgname##python-}
pkgver=2.6.0
pkgrel=1
pkgdesc='Google Cloud API client core library'
url=https://github.com/googleapis/${_reponame}/tree/${_pkgname}-v${pkgver}/packages/${_pkgname}
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
source=(${pkgname}-${pkgver}.tar.gz::${url%/tree*}/archive/${_pkgname}-v${pkgver}.tar.gz)
b2sums=('18ecd6ce915a8dcb410397f68c39af50726422312ca028b087951015839ebd46ef4dc1feca0a78a53e2ac3f0eadc90bd1dfe629dfabc313d6eb5f27bc36b1e24')

build() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m build \
    --wheel \
    --no-isolation
}

package() {
  cd ${_reponame}-${_pkgname}-v${pkgver}/packages/${_pkgname}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.rst

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
