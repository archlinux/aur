# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.24
pkgrel=1
pkgdesc="Advanced Package Manager & Environment Orchestrator (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/zillowe/zillwen/zusty/zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('git' 'gnupg')
optdepends=(
  'bash-completion: for bash shell completion'
  'zsh: for zsh shell completion'
  'fish: for fish shell completion'
  'bubblewrap: for running contained apps'
)
_downloads="$url/-/releases/Prod-Release-$pkgver/downloads"

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$_downloads/${pkgname%-bin}-linux-amd64.tar.zst"
  "LICENSE::$_downloads/LICENSE"
  "zoi.1::$_downloads/zoi.1"
  "zoi-rs.3::$_downloads/zoi-rs.3"
  "zoi-lua.5::$_downloads/zoi-lua.5")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$_downloads/${pkgname%-bin}-linux-arm64.tar.zst"
  "LICENSE::$_downloads/LICENSE"
  "zoi.1::$_downloads/zoi.1"
  "zoi-rs.3::$_downloads/zoi-rs.3"
  "zoi-lua.5::$_downloads/zoi-lua.5")

sha512sums_x86_64=('ffcd26fabfb8f936ee4fcc68177d8759f3cb27e0bb2799c73f14d43abb33bf5a45f16ab50fa9f2e5419d2fa293002a17e8add16a47a877a0ad97225ea5ed1aae'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7cb7ea8762448d69449d216f54060394fce22c5e53ff92b8b5c4a34465092c04386a37138264920aed7ff884833e9b806030c8c8aa8f3d373b3ae205547e33e9'
  '00723783783c29b1792e442241ce86ba3aedbbb72b66786b2254bda13583e95ea18a70037e263d954e9ad0354bc867cabe1bc96a0e031ae808f10c5e1d3b4ea9'
  '0b5849eb24ff0cf6f0bfc920da0dfc1afffdf0a9b18d36a09428fc9aad22eefc800409d780eebba5a94d8728ca0c0a87de9b81a5d9699de3212c5d47327baa90')
sha512sums_aarch64=('cc2f58fd298fbfc5207f2ee6a36ccff84b64023e731a54b76f422d516d1476da043d5ed5e29137c2637726b143ca31f2a45b12ab80ec88a1cd2cf2881b062721'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7cb7ea8762448d69449d216f54060394fce22c5e53ff92b8b5c4a34465092c04386a37138264920aed7ff884833e9b806030c8c8aa8f3d373b3ae205547e33e9'
  '00723783783c29b1792e442241ce86ba3aedbbb72b66786b2254bda13583e95ea18a70037e263d954e9ad0354bc867cabe1bc96a0e031ae808f10c5e1d3b4ea9'
  '0b5849eb24ff0cf6f0bfc920da0dfc1afffdf0a9b18d36a09428fc9aad22eefc800409d780eebba5a94d8728ca0c0a87de9b81a5d9699de3212c5d47327baa90')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions bash >"$_bash_completion_dir/${pkgname%-bin}"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions zsh >"$_zsh_completion_dir/_${pkgname%-bin}"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions fish >"$_fish_completion_dir/${pkgname%-bin}.fish"

  install -Dm644 "${srcdir}/zoi.1" "$pkgdir/usr/share/man/man1/zoi.1"
  install -Dm644 "${srcdir}/zoi-rs.3" "$pkgdir/usr/share/man/man3/zoi-rs.3"
  install -Dm644 "${srcdir}/zoi-lua.5" "$pkgdir/usr/share/man/man5/zoi-lua.5"
}
