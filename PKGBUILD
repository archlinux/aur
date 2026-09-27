# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Prebuilt binary)"
arch=('x86_64' 'aarch64')
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

# release 资产按架构分别下载：tarball 内为平铺的 cnmplayer + LICENSE（无顶层目录）。
# 资产名用的是 amd64/aarch64，与 CARCH 的 x86_64/aarch64 不同，故 URL 里直接写死
# 资产名而不引用 CARCH —— makepkg 只会取当前架构对应的 source_* 数组。
_url_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_url_base}/CNMPlayer_v${pkgver}_linux_amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_url_base}/CNMPlayer_v${pkgver}_linux_aarch64.tar.xz")

# pkgver 与下面两行 sha256 由 GitHub Actions 的 aur_sync.sh 每版自动重算
sha256sums_x86_64=('80910d06cd7292e1a999a706af5fa4a0d404abe3caf4d1716d003780239270b5')
sha256sums_aarch64=('18745ca1c4c7283cc04197ffd85dff111e09b9b69e891f11274814bc0de893b4')

package() {
  install -Dm755 "cnmplayer" "${pkgdir}/usr/bin/cnmplayer"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
