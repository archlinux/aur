# Maintainer: envolution
# Contributor: Butui Hu <hot123tea123@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.14.0
pkgrel=1
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
sha512sums=('c7b4466440f4bd00b3e99017fb0923dce94a0d4374d87d886cef7ec38cccc86df6d5f67db1bd38ae7c1dd65f08f72f40f7740e8389721be90228e49d199fd65a')

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
