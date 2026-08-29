# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Prebuilt binary)"
arch=('x86_64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL3')
depends=('alsa-lib' 'chafa' 'glib2' 'openssl' 'pipewire')
optdepends=(
  'cava: spectrum visualization'
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
provides=("cnmplayer=${pkgver}")
conflicts=('cnmplayer' 'cnmplayer-git')

# release 资产架构名（amd64/aarch64）与 CARCH（x86_64/aarch64）的映射
case "$CARCH" in
  x86_64) _asset_arch='amd64' ;;
  aarch64) _asset_arch='aarch64' ;;
esac

# tarball 内为平铺的 cnmplayer + LICENSE（无顶层目录）
source_x86_64=("${pkgname}-${pkgver}.tar.xz::https://github.com/professor-lee/CNMPlayer/releases/download/v${pkgver}/CNMPlayer_v${pkgver}_linux_${_asset_arch}.tar.xz")
sha256sums_x86_64=('289b182538496b7451e5fd9f8f9afee57dbb312d7cac998407cc0446c991bdaa')

# aarch64 资产在首个双架构 release（v0.6.0）后补充 source_aarch64/sha256sums_aarch64，
# 届时 arch 数组加入 'aarch64'；后续 pkgver 与 sha256 由 GitHub Actions 自动维护

package() {
  install -Dm755 "cnmplayer" "${pkgdir}/usr/bin/cnmplayer"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
