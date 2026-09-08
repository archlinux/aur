# Maintainer: 30p87 <aur@30p87.de>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=albucore
pkgname=python-albucore
pkgver=0.2.18
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
sha512sums=('7d4754b7f0bc2ceb5ebd6f017949ee3464fde9c8a5a2bfe47dd8a7c6223db7b1456896a82ae6c2965872ccf505a7691506d24239260998025f2947597d482c5d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
