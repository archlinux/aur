# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsduck-bin
_pkgver=3.41-4299
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
sha256sums_x86_64=('ca73d101def4dbf8716d554a19f700b4078041a5aab41d52b159515177bedb8b'
                   'dbdf315934a88f872ecf321f52203ffb37cb47423b502d9787afe60207d26efa')
sha256sums_aarch64=('ad2a4ea7258151f1b5d931600df20dce27721940637940dd2e039e70cee02fb5'
                    'b66eba726e53d29b80951011813023b146197078dace429ebfec6cf22978deab')

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
