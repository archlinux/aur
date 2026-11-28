# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.25
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

sha512sums_x86_64=('8a9b27abd60bd70c0e353178d5bf28f127118a8df70ad25f2307f0a13c876460d4bb3a3e3457c930697c64bbafc3006f1718d623df96d3827d7b7a7cf9f39396'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '5a01703035cc2b11a7954a3ac21fd5d160e24dc40040525d578603e77411d73fb09c62bb95a1c616b857b9c034e21450c52362800b9365d15eb70dbd3e093a98'
  'c94bec0e8d2ccdbb8773fd60700dc90b0cc3479b308e25c12f6442b54a197b693f891059ea4ab1ac691eb2a835003a78168644c2368afc0b9281914d71865a50'
  '4548c01b3aa10112dc289bf9d6b787e9d228efa612c85921ee39d0661c1347ef3b6685e47096d7fb5153476012b39c6a8784a4e52bbd9d5377a0d6c6c45e5ed3')
sha512sums_aarch64=('a39f85a9ccb3ab939db76b2a959328fd2ac9a0e18c39a113d6a87b2d2dafe0935dba0343f3b9774c36db1548dc805e3d8b83bd5a910584ac46b4f8bdeef7b3b0'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '5a01703035cc2b11a7954a3ac21fd5d160e24dc40040525d578603e77411d73fb09c62bb95a1c616b857b9c034e21450c52362800b9365d15eb70dbd3e093a98'
  'c94bec0e8d2ccdbb8773fd60700dc90b0cc3479b308e25c12f6442b54a197b693f891059ea4ab1ac691eb2a835003a78168644c2368afc0b9281914d71865a50'
  '4548c01b3aa10112dc289bf9d6b787e9d228efa612c85921ee39d0661c1347ef3b6685e47096d7fb5153476012b39c6a8784a4e52bbd9d5377a0d6c6c45e5ed3')

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
