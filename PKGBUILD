# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=opengrep-bin
pkgver=2.0.0
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
sha256sums=('3ae46d85b3ff3dafbf302b981f31a4dd59e9206040ed68de0174b0781b23c2cd')
source_x86_64=("opengrep_linux_x86_v${pkgver}::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep_linux_x86")
sha256sums_x86_64=('37e93f4da5fd04a18c5c1febbdd12f7e98dfccd4d0c9cf2593bcb25eeb462da0')
source_aarch64=("opengrep_linux_aarch64_v${pkgver}::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep_linux_aarch64")
sha256sums_aarch64=('6257b65423a744b704af2ff9beeb8f222c2f6925236af386b56b031d4c06d6d8')

package() {
  local _binary=opengrep_linux_x86
  [[ "$CARCH" == aarch64 ]] && _binary=opengrep_linux_aarch64
  install -Dm755 "${srcdir}/${_binary}_v${pkgver}" "${pkgdir}/usr/bin/opengrep"
  install -Dm644 "opengrep-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
