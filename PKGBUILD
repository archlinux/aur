# Maintainer: Yubo-Cao <cao2006721 at gmail dot com>

pkgname=herdr-gui-bin
pkgver=0.4.10
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
  '5cc5152309654de28d608df1c3d3fdf2e7c04fcb201418fccca2587b529e4780'
)
sha256sums_x86_64=('a674e01ce506ae1a59ded3ed43b04f56a0e4ca2800b2ea5944ec3b3d28664fc1')
sha256sums_aarch64=('b0056ede54655fb7fed3609cd52b17a6526ce9e16af4307f42e8f15b5366873a')

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
