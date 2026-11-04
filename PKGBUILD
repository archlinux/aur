# Maintainer: 30p87 <aur@30p87.de>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=albucore
pkgname=python-albucore
pkgver=0.3.4
pkgrel=2
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
sha512sums=('8e12717ba4441cd62f31e2c2a5b1d7ef9509540712c6bca542864e43eed445b00e1c2d7b6b07c5a1bdce02aca3ec092a04305cb7c14290b6332fe9cc5770c7d1')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
