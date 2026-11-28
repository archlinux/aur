# Maintainer: 30p87 <aur@30p87.de>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=albucore
pkgname=python-albucore
pkgver=0.3.13
pkgrel=1
pkgdesc='A high-performance image processing library designed to optimize and extend the Albumentations library with specialized functions for advanced image transformations'
arch=('any')
url='https://github.com/albumentations-team/albucore'
license=('MIT')
depends=(
  python-numpy
  python-opencv
  python-numkong
  python-stringzilla
)
makedepends=(
  python-build
  python-installer
  python-hatchling
)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('5d0a4c0695cd43da6036ccdc18d0650087fd37ae0762b7cb189d66140ab041e9d16f101f9ddfc352d9b351e79ebc785bd2a68e10050b48cdf1fbd5aeec465574')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
