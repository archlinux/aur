# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsduck-bin
_pkgver=3.42-4421
pkgver="${_pkgver%-*}"
pkgrel=1
pkgdesc="MPEG Transport Stream Toolkit"
arch=('x86_64' 'aarch64')
url="https://tsduck.io/"
license=('BSD-2-Clause')
depends=(
  'bash'
  'curl'
  'gcc-libs'
  'glibc'
  'java-runtime'
  'libcurl-compat'
  'libcurl-gnutls'
  'libedit'
  'librist'
  'libusb'
  'openssl'
  'pcsclite'
  'python'
  'srt'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(!debug !strip)
source_x86_64=(
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc42.x86_64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc42.x86_64.rpm"
)
source_aarch64=(
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc42.aarch64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc42.aarch64.rpm"
)
sha256sums_x86_64=('a0c8536a7b8167bf1a6bcde79b9fba9ad91a2505a3450eca62b98ce508d93cdb'
                   '26fd24f5cae17c9d409f5d38a2e79995209c0737c69d9eaacc5f594281279875')
sha256sums_aarch64=('fa9547643a5501534c23c2eafc7f74d37eb542a1b6255c0965370280cb8c13f7'
                    'b05b77c895129035227bde69494a7d5107a2427a99f6a576e78f95829b2e70a3')

prepare() {
  # Move all libs to /usr/lib
  mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
  cp -r "${srcdir}/lib/udev" "${srcdir}/usr/lib"
}

package() {
  install -dm755 "${pkgdir}/usr"
  install -dm755 "${pkgdir}/etc"
  cp -r --no-preserve=ownership "${srcdir}"/{etc,usr} "${pkgdir}"
  install -Dm644 "${srcdir}/usr/share/doc/tsduck/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
