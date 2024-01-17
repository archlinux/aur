# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Aaron Liu <aaronliu0130 at gmail dot com

pkgname=python-pyvips
_pkgname=pyvips
pkgver=2.2.2
pkgrel=1
pkgdesc='Python binding for libvips using cffi'
arch=(any)
url='https://github.com/libvips/pyvips'
license=(MIT)
depends=(
  libvips
  python-cffi
  python-numpy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/libvips/pyvips/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('89f5b0cae73720f0a52d872c4ee0a43a1bc40f02565c07b2d7558aaeead23bf8')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
