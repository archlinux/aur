# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Aaron Liu <aaronliu0130 at gmail dot com

pkgname=python-pyvips
_pkgname=pyvips
pkgver=2.2.1
pkgrel=0
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
sha512sums=('1656f13bf3f8a3f0975367c40c5478ffaf3f23712a46f1c8a293cfac8e4ce20afe2b967c9ffd00fb37a648410eaa5186ef2f48d922bd8eac8a6abbe77ace82fa')

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
