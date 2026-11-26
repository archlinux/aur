# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=opengrep-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Fork of semgrep (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/opengrep/opengrep"
license=('LGPL-2.1-only')
provides=("opengrep=${pkgver}")
conflicts=('opengrep')
depends=('git' 'ca-certificates')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/opengrep/opengrep/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ccefdf7bd039498a913089c24f71935f8932c137f3edcb25b70ed3b3c5779a7')
sha256sums_x86_64=('d6a68a84c01a3d8ee933f60847decf1b4d0fd7791a26833b32b95922baf28974')
sha256sums_aarch64=('3abfc87d66f208efd143a1b408d489af934cea7d9968ab1f37dca001f9886092')
source_x86_64=("opengrep_linux_x86_v${pkgver}::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep_linux_x86")
source_aarch64=("opengrep_linux_aarch64_v${pkgver}::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep_linux_aarch64")

package() {
  local _binary=opengrep_linux_x86
  [[ "$CARCH" == aarch64 ]] && _binary=opengrep_linux_aarch64
  install -Dm755 "${srcdir}/${_binary}_v${pkgver}" "${pkgdir}/usr/bin/opengrep"
  install -Dm644 "opengrep-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
