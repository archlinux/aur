# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.1
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

sha512sums_x86_64=('33a32783d0adfb3f15526073788ff2ae2cde27a4f62d0a405839ee1c599048d5a5da70ad5e3e57a2266b7e15cc32deac04d631a602ff57cabbf5637369866e15'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b9cf00b56b61a0dddd796f08c01e1f76e689769a1dee3e10f9a902e887ca0d79339c9dfed44481fc45228efbcbd40751c4f7ee7d07ee838c5bd31cf461224534'
  '6bc647034e383f2c474c648226aa83efaf47a2071cf51f986d512b6b9368c4a4b3b67830d90b348562686f06ad7eae362fa15311f46a0c737ad7a8d8cb4cb44d'
  '318e4f314511cea9e9f132a50626df5567113773c87ff48e65d3a36f98d2d5751ffc3b0d30a1ab8e6a1c5f38db14e4688f6188cb675adb68bfd5b5e1ee02d8f1')
sha512sums_aarch64=('cd67a3e2268acbeb4043663b4854ef735c37fcfeac3352dfa73589b3190ed93e515c3dca848945832477df5f0dbe6a1ca7e61df61143803c53fd53ef5c748fc6'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b9cf00b56b61a0dddd796f08c01e1f76e689769a1dee3e10f9a902e887ca0d79339c9dfed44481fc45228efbcbd40751c4f7ee7d07ee838c5bd31cf461224534'
  '6bc647034e383f2c474c648226aa83efaf47a2071cf51f986d512b6b9368c4a4b3b67830d90b348562686f06ad7eae362fa15311f46a0c737ad7a8d8cb4cb44d'
  '318e4f314511cea9e9f132a50626df5567113773c87ff48e65d3a36f98d2d5751ffc3b0d30a1ab8e6a1c5f38db14e4688f6188cb675adb68bfd5b5e1ee02d8f1')

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
