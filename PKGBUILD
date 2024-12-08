# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsduck-bin
_pkgver=3.39-3956
pkgver="${_pkgver%-*}"
pkgrel=2
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
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=(!debug)
source_x86_64=("https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc41.x86_64.rpm"
               "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc41.x86_64.rpm")
source_aarch64=("https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc41.aarch64.rpm"
                "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc41.aarch64.rpm")
sha256sums_x86_64=('cf48e8eaa6b1660bf001eab6a187c0b901aadcd79be14963ab6368a898ff65b4'
                   '3ff6c180455693edceaca10d949048c7e493867dd6474c665273c68087041f07')
sha256sums_aarch64=('8565fa5216a013caaee8350a3e54296ac9fe4ef9f806881a823b95156ce1b94b'
                    '86c9473626f3b0c2e56fa99b024d11bd5cca0e30404deb40ad4221b49f8b4400')

prepare() {
  # Move all libs to /usr/lib
  mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
  cp -Pr "${srcdir}/lib/udev" "${srcdir}/usr/lib"
}

package() {
  install -dm755 "${pkgdir}/usr"
  install -dm755 "${pkgdir}/etc"
  cp -Pr --no-preserve=ownership "${srcdir}"/{etc,usr} "${pkgdir}"
  install -Dm644 "${srcdir}/usr/share/doc/tsduck/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
