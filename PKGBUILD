# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsduck-bin
_pkgver=3.44-4676
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
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc43.x86_64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc43.x86_64.rpm"
)
source_aarch64=(
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc43.aarch64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc43.aarch64.rpm"
)
sha256sums_x86_64=('6191bddaf90256eda51a140ca3daa360452f4b5bf417fcc73c13136235ca54b0'
                   '2a14988d6876172975a222c7a575ab197129e968487f64a77ec6330b047ed3a7')
sha256sums_aarch64=('e5b00e781be0c1089afb34166685f2dd3810ee569954c0a103da76f0d1eead99'
                    '8709fb46a5a0161260e273bc5609453a866a77235a1f122bebe5dcd94e3a23d5')

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
