# Maintainer: 30p87 <aur@30p87.de>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=albucore
pkgname=python-albucore
pkgver=0.3.4
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
sha512sums=('9907b728b4df57973161b9b8a708c72a6c626ba41c39c78cf897bb9e87698b6fea5f1b261d5c0042206cb7c3cab61c9ee745bb38151b96605dbcf035f1b52bf0')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
