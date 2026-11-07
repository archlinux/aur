# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.11
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

sha512sums_x86_64=('00c3591c09cc9d59cc3523439d18a0d510522913ebd74bf96a7c2a33286c34179b28ae98f39e079fc24d7e9cfa918223567a88bbf2fa3328ceb6ba5f21b9bccc'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b43f86d693f842af0432ba3a879e99b328f5bc34e40882c607fdb6f266bccddcebce50cd77c963b053c8b78c4212286386e4d69b7c29dc28b59152e72f2468ca'
  '61eda9e4df19f9b64c5ee0bd1cbf9a5f6b375176103a676d3a730dcefa781fc345aed31a050de420b7d425fa1101b65d9b5119275718967f922cdc0bc0946d04'
  'a6a4fd33d2a9a3fa375b75cd6495a793841ea85de42672317c45d8cf33fd76a0a0182378fdcfa3d281220da186e354a7fd241000ccb5c2e38466313899e5052a')
sha512sums_aarch64=('992579ca4b6a109db170c91b1d8236f19e663b5a8373ca47ae1175da820470aef0a7842141224584610f870d70f4348d61e5df3852230296ea62db63b213384a'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b43f86d693f842af0432ba3a879e99b328f5bc34e40882c607fdb6f266bccddcebce50cd77c963b053c8b78c4212286386e4d69b7c29dc28b59152e72f2468ca'
  '61eda9e4df19f9b64c5ee0bd1cbf9a5f6b375176103a676d3a730dcefa781fc345aed31a050de420b7d425fa1101b65d9b5119275718967f922cdc0bc0946d04'
  'a6a4fd33d2a9a3fa375b75cd6495a793841ea85de42672317c45d8cf33fd76a0a0182378fdcfa3d281220da186e354a7fd241000ccb5c2e38466313899e5052a')

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
