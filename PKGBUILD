# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=tsduck-bin
_pkgver=3.45-4798
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
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc44.x86_64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc44.x86_64.rpm"
)
source_aarch64=(
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc44.aarch64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc44.aarch64.rpm"
)
sha256sums_x86_64=('4c9fc820fe26c8210d7967529b74df67941a1c89ad5dc6ecb6c719d008579b10'
                   '6fd860ea753b5d2283a4f2e82a07948696f1f4761fb4b1ad4c547b8edfa4654b')
sha256sums_aarch64=('04c38f90f8f5dc1352652ff2b349ca32f17079f53933cb0647e6a9f2b30d4400'
                    '27b00b171f47ddaacf0eef1313eb6061cf02ca55a3a11c24ad6eb846f9cea8d5')

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
