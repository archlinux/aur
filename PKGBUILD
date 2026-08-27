# Maintainer: Yubo-Cao <cao2006721 at gmail dot com>

pkgname=herdr-gui-bin
pkgver=0.4.7
pkgrel=1
pkgdesc="Self-hosted web GUI for Herdr"
arch=('x86_64' 'aarch64')
url="https://github.com/powerfooI/herdr-gui"
license=('MIT')
depends=('glibc')
optdepends=(
  'herdr: manage a local Herdr server'
  'openssh: connect to remote Herdr servers'
)
provides=("herdr-gui=${pkgver}")
conflicts=('herdr-gui')
options=('!strip' '!debug')
source=(
  "LICENSE.upstream::${url}/raw/v${pkgver}/LICENSE"
  "THIRD_PARTY_NOTICES.md::${url}/raw/v${pkgver}/THIRD_PARTY_NOTICES.md"
)
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.tar.xz::${url}/releases/download/v${pkgver}/herdr-gui-v${pkgver}-linux-x64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/herdr-gui-v${pkgver}-linux-arm64.tar.xz")
sha256sums=(
  'f0366103e89c5b21afe3f414c1f708dfa2e6d261e54cd2ea1b893cb2188ea61e'
  '15fb42d367661e7306881d36f9b49ae8e224c7f82747f11bbadde4046b613b72'
)
sha256sums_x86_64=('a003d64a377bf092f91f02b7fdf591c08d46711c0f8e18f0e47381bff3a96c2e')
sha256sums_aarch64=('33abdc1bfdb369ff7bf78da0b015974d14a8c8231278bc8f8b42d891cc941328')

package() {
  local platform='x64'
  [[ $CARCH == aarch64 ]] && platform='arm64'

  install -Dm755 "herdr-gui-linux-${platform}/herdr-gui" \
    "${pkgdir}/usr/bin/herdr-gui"
  install -Dm644 LICENSE.upstream \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md \
    "${pkgdir}/usr/share/doc/${pkgname}/THIRD_PARTY_NOTICES.md"
}
