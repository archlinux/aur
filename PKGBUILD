# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.22
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

sha512sums_x86_64=('0e044218d716355319950ec25e5ff1ce6cdc41787c49b105150da85e26434abd33d3b5eb273bbb5e712be858d688f209a74b00a0048de62798e61dbbd806ec5f'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'dae466200b92c37cfb3d61fdf28aae92529fe0c8db7d1cd292cc6e1e7bf40b0a837c8cba7047d9adb2c381b0923b6782c5632c38527be35e128a7d003e1b804d'
  'e1869d3a5574e6737cde6e92ad363ae43bfb5e4d3e6065624dfb3ad7fb54e2c9e06eb7436b0dae7fede460009bfa7ff75712e3170c18e3b51933ebc155613b1b'
  'efaf6dd9d5b8f2eea2e83c7050904bfebe8a1c0d8f9212a706e5de992b026d2eba5fd5bbcc77165269640a3894ea92f0d38b3ab57f8274f96169655a55c37d91')
sha512sums_aarch64=('0274b13054a63e7641c147c56b80409fc4d6e8902bc275919ca3764c114b93181b5135f0e68be74c8f916c344971c657ae77c0082c752f0cd04724047cb17f97'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'dae466200b92c37cfb3d61fdf28aae92529fe0c8db7d1cd292cc6e1e7bf40b0a837c8cba7047d9adb2c381b0923b6782c5632c38527be35e128a7d003e1b804d'
  'e1869d3a5574e6737cde6e92ad363ae43bfb5e4d3e6065624dfb3ad7fb54e2c9e06eb7436b0dae7fede460009bfa7ff75712e3170c18e3b51933ebc155613b1b'
  'efaf6dd9d5b8f2eea2e83c7050904bfebe8a1c0d8f9212a706e5de992b026d2eba5fd5bbcc77165269640a3894ea92f0d38b3ab57f8274f96169655a55c37d91')

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
