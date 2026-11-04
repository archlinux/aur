# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.8
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

sha512sums_x86_64=('0902deb73156aa4d14407a15a2f1c22cfd9c26ce1fde42d3e5a063adbf7dd2855212227c47b72ead8ef32914ba73ff93597845f4773dd01cd35a8b6952a0d6cb'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '9e1c068a62301a853f3377fa3323a81c25c28a69825969da07e87ca89e0f62504f164fbcdd4693b1a185cd89ecb76027c738ec119137b4b22eaa5f489c8779b7'
  '3d171e604d51e08ccbcd633bfac5019d6d597f67525c442e98bc6b47268a3a4483fea671cb7cf2b287af55592ba393651ea8a1ed033bbd100dbc15d722371f90'
  'baf75e87fd29d97ac3bd11db85c42b45d6707d5f3f6a97d13fda98fcb7214ec274a490e98a158ca5119a48a70ab5fa97fe869b8d3c00eb316eb7abe63b78d56a')
sha512sums_aarch64=('7929cd4f5e7222661111bc5e64f2d2a92e9e03d24657e53214c5abe9b204fd9ef87cdae31085a7f28e833a11fa9073b90985b99face7e35ba6f756277518d507'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '9e1c068a62301a853f3377fa3323a81c25c28a69825969da07e87ca89e0f62504f164fbcdd4693b1a185cd89ecb76027c738ec119137b4b22eaa5f489c8779b7'
  '3d171e604d51e08ccbcd633bfac5019d6d597f67525c442e98bc6b47268a3a4483fea671cb7cf2b287af55592ba393651ea8a1ed033bbd100dbc15d722371f90'
  'baf75e87fd29d97ac3bd11db85c42b45d6707d5f3f6a97d13fda98fcb7214ec274a490e98a158ca5119a48a70ab5fa97fe869b8d3c00eb316eb7abe63b78d56a')

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
