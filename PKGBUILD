# Maintainer: Professor Lee <https://github.com/professor-lee>
pkgname=cnmplayer-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A terminal-based Netease cloud music player with spectrum visualizer, lyrics support. (Prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/professor-lee/CNMPlayer"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'chafa' 'glib2' 'openssl' 'pipewire')
optdepends=(
  'ttf-nerd-fonts-symbols: For icons and spectrum visualizer'
  'ttf-jetbrains-mono-nerd: Recommended monospace font'
)
provides=("cnmplayer=${pkgver}")
conflicts=('cnmplayer' 'cnmplayer-git')

# Release tarballs contain flat cnmplayer, LICENSE and THIRD_PARTY_NOTICES.md files.
# Asset names use amd64/aarch64, whereas Arch uses x86_64/aarch64.
# makepkg selects only the source_* array for the current architecture.
_url_base="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_url_base}/CNMPlayer_v${pkgver}_linux_amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_url_base}/CNMPlayer_v${pkgver}_linux_aarch64.tar.xz")

# The release sync renders the version and asset checksums into this template.
sha256sums_x86_64=('441fb06afa9525b8120e8155a687ff50ccfbc98e4600d73d2c2d00eec9d5e3c2')
sha256sums_aarch64=('3908edd5ac46c84d0e0f50f7b4cce37ad6727d1f07e0d1dccd7182347a562799')

package() {
  install -Dm755 "cnmplayer" "${pkgdir}/usr/bin/cnmplayer"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
