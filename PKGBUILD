# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.5
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

sha512sums_x86_64=('2c32e9f75bb64f06cd61e6772d77393472a06887bb76125d39f864e3b5637130ca0eaa87bf713d71f3ad1a73e4e5c994f0588a5c6d84a11383b6c5f2e4d62cf2'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '824838c219c1b6242d3b37fde98d04e6e17d16b6432972147aea8f029ba8e1807ae69e8483118518f437d63d36f56626a1b940aa5d40a7b0fe3eb39d42d218f6'
  '3dce6d0e28125ddfaf5d86b9a4a59a5eb2da3b8c73a1492e5689caa33c80f109056c4cfd5fc154f758e8644297040f5dac9af6c93aada186ccf2c8ab8917650c'
  '6a0728231f78b06f82a58a7acd4ab0c7b08902e5553cbb0ceb241ed659af691f4e3289baf19904a6765fa4f9134acd8b4ca253a97db27b0ac8f9e21cc7d33e62')
sha512sums_aarch64=('35c189bc3f1c95821885a077d4c9a0f1da781b05c7152ed537f29113199be2f396001cf91ad5ffb798e473020eef29475c529a3bf18d84fa35095bc693b3cf6c'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '824838c219c1b6242d3b37fde98d04e6e17d16b6432972147aea8f029ba8e1807ae69e8483118518f437d63d36f56626a1b940aa5d40a7b0fe3eb39d42d218f6'
  '3dce6d0e28125ddfaf5d86b9a4a59a5eb2da3b8c73a1492e5689caa33c80f109056c4cfd5fc154f758e8644297040f5dac9af6c93aada186ccf2c8ab8917650c'
  '6a0728231f78b06f82a58a7acd4ab0c7b08902e5553cbb0ceb241ed659af691f4e3289baf19904a6765fa4f9134acd8b4ca253a97db27b0ac8f9e21cc7d33e62')

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
