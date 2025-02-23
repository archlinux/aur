# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=tsduck-bin
_pkgver=3.40-4165
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
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc41.x86_64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc41.x86_64.rpm"
)
source_aarch64=(
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-${_pkgver}.fc41.aarch64.rpm"
  "https://github.com/tsduck/tsduck/releases/download/v${_pkgver}/tsduck-devel-${_pkgver}.fc41.aarch64.rpm"
)
sha256sums_x86_64=('33edabea9e88b68dd38f5098d048726e7cd6678b16c789a5dd3c280e3efe773f'
                   '05baea36835f08d7dccfe353b9c174f47f0912751ab8e66984f9aeec04c0ec2a')
sha256sums_aarch64=('6faf5740522332762ea1189c3e2175e1c2e718d0a11a35595bfb18bbf2865619'
                    '1db1bb3edea41133e2e42edab190b6a5d49eee5b5c38dee3a6949cd25bf607d7')

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
