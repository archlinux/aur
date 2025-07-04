# Maintainer: envolution
# Contributor: Butui Hu <hot123tea123@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.13.0
pkgrel=2
pkgdesc='WebRTC and ORTC implementation for Python using asyncio'
arch=(any)
url='https://github.com/aiortc/aiortc'
license=('BSD-3-Clause')
depends=(
  python-aioice
  python-av
  python-cryptography
  python-google-crc32c
  python-pyee
  python-pylibsrtp
  python-pyopenssl
  python-cffi
)
#ignore namcap warning of python-cffi as it's marked as required by egg-info
checkdepends=(
  python-aiohttp
  python-numpy
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aiortc/aiortc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9f030cc416ce39298b5b0f0747c756dc9aa519f3270316f235ca37385e071e498095e8a13ae4ae4d865b376db72cb6db43b6c26a2037b53f1d50ba432158dc9d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=src/ python -m pytest tests
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
