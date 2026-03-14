# Maintainer: Brody <archfan at brodix dot de>

pkgname=python-google-cloud-core
_pkgname=python-${pkgname##*python-google-}
pkgver=2.5.0
pkgrel=3
pkgdesc='Google Cloud API client core library'
url=https://github.com/googleapis/${_pkgname}
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
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('15ea36bcf0c7a92bee3a1cb8696da51f3a45e2f3f393ef15defa4d5bc3e2c3dc616f13c76ba7ab2bb7876688ddf612f12f4870be830dbf96a025233990e77388')

build() {
  cd ${_pkgname}-${pkgver}

  python -m build \
    --wheel \
    --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}

  python -m installer \
    --destdir="${pkgdir}" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname} \
    README.rst

  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} \
    LICENSE
}

# vim: ts=2 sw=2 et:
