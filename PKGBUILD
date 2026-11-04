# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.6
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

sha512sums_x86_64=('8057ccbd6064f5842f60753e98bfeed791e304ee21af4b515a0641132d67f31a9232337af1b3448f6f9c49acde1962c083085c857a5c72ea588781f79142390b'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '9e1c068a62301a853f3377fa3323a81c25c28a69825969da07e87ca89e0f62504f164fbcdd4693b1a185cd89ecb76027c738ec119137b4b22eaa5f489c8779b7'
  '3d171e604d51e08ccbcd633bfac5019d6d597f67525c442e98bc6b47268a3a4483fea671cb7cf2b287af55592ba393651ea8a1ed033bbd100dbc15d722371f90'
  'baf75e87fd29d97ac3bd11db85c42b45d6707d5f3f6a97d13fda98fcb7214ec274a490e98a158ca5119a48a70ab5fa97fe869b8d3c00eb316eb7abe63b78d56a')
sha512sums_aarch64=('ff4687cb10d613fcd80b1adabb5325bd5879099f34346462f43aae7d4693cafd71ea3381a735e67894050396650fb875338feb9b6e802274bd1f78022580e3b6'
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
