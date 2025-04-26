# Maintainer: envolution
# Contributor: Butui Hu <hot123tea123@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=aiortc
pkgname=python-aiortc
pkgver=1.11.0
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
sha512sums=('ad977817ae79702002d1f1b02b35ee3bbb4b4bbde346903b2fb9ef7e3a7beea477557f54ebeecb8af7a23cef9bb58c312ad79927ba9bd60108b8e3143bd38f58')

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
