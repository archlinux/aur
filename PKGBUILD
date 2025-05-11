# Maintainer: envolution
# Contributor: Butui Hu <hot123tea123@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.12.0
pkgrel=1
pkgdesc='WebRTC and ORTC implementation for Python using asyncio'
arch=('x86_64')
url='https://github.com/aiortc/aiortc'
license=('BSD-3-Clause')
depends=(
  python-aioice
  python-av
  python-cffi
  python-cryptography
  python-google-crc32c
  python-pyee
  python-pylibsrtp
  python-pyopenssl
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aiortc/aiortc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('04a418fb3c2c2af5e829af490c95e0a0e1b3741d173a76c53a0c3913edb2862e4c81beaf978cb3ba42a2a7939f6815b6b9a02a5f6f4bc80bb8f1e8676ed3d465')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
