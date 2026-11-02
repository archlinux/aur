# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.4
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

sha512sums_x86_64=('9d368c6b4fac6e784668b4a9ebc0daf46a35c5ae4299336eae1416158e6e6567ed882f0f3fce7ea7f2dbe5457827891593cf1d1584926539aacac418a3f3232e'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'dd725a538b37cf48728879e2434b1821a663096a3d58ebaccc4266b27c5dc489e44423db3e50619365ed87bc0879364e2f0c22c0d28867873b55148b9340f935'
  'ba56c449375206d999581ce408119250422271f75e5acdbbddf0b80fbabb983a3576d6dac29aa12fa82ad17cc699200a73b646fcc404b34c9cd32aadcd30f9a4'
  'd5c1fd30e492f4eaea9b394df88d14bce7f2f1c69e3592f9b368d50e5fff6c449a29adc228c7d9711a33368712d3b6e29af29728b0f182d7897cee7037dfd2bd')
sha512sums_aarch64=('14b0d8f512f26bd50bf85d8dadc3f2938e3d7ba544bdced1fc96e3f1177b62ec53fcde9416f423d447435c237b381ec1110afb144c54dec498c606d072c50216'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'dd725a538b37cf48728879e2434b1821a663096a3d58ebaccc4266b27c5dc489e44423db3e50619365ed87bc0879364e2f0c22c0d28867873b55148b9340f935'
  'ba56c449375206d999581ce408119250422271f75e5acdbbddf0b80fbabb983a3576d6dac29aa12fa82ad17cc699200a73b646fcc404b34c9cd32aadcd30f9a4'
  'd5c1fd30e492f4eaea9b394df88d14bce7f2f1c69e3592f9b368d50e5fff6c449a29adc228c7d9711a33368712d3b6e29af29728b0f182d7897cee7037dfd2bd')

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
