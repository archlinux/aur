# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.12
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

sha512sums_x86_64=('a5a549ab793a04ebd7dc32e3d8ff334cf0c6d400bd5479dbf0db842d5d7cfbbe9d820f89a5f8b3b8eaa1bc41b2bc099eb2fa5e66b36db5fb9b11a3cd80948f7d'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '02607b9e0d2e0e903534564ff2663b428c98c66758bac3c4dc324e5b8f3d16f5d1057443b2f27b8429ae6ed68e342de37619d164155525d4688a1453aa0caa26'
  '705b5fd1501c099d852cdb224c0ece6f2d1df83d3cf76e8646983816caec9f6db72969552af54dce8dfffa2ad8b466b39442a58e55df5a741d995a2eb5fdc2c3'
  'e61106155b2e840f764f1bca0c0397a14f0808ba39673d5a8649fb91d777469eb49e7a0e18f923829e39a6feadb4e33c5a828296d8029215cbe5abab3a20e2f9')
sha512sums_aarch64=('00cfc9dced4d9b597fe8b16fd55f50f9be82e4f2f1c124b4987859c820a6b2414b1ded7ea56749b100540c4eec12145cde422f737e5285d2d618da3fd36997b6'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '02607b9e0d2e0e903534564ff2663b428c98c66758bac3c4dc324e5b8f3d16f5d1057443b2f27b8429ae6ed68e342de37619d164155525d4688a1453aa0caa26'
  '705b5fd1501c099d852cdb224c0ece6f2d1df83d3cf76e8646983816caec9f6db72969552af54dce8dfffa2ad8b466b39442a58e55df5a741d995a2eb5fdc2c3'
  'e61106155b2e840f764f1bca0c0397a14f0808ba39673d5a8649fb91d777469eb49e7a0e18f923829e39a6feadb4e33c5a828296d8029215cbe5abab3a20e2f9')

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
