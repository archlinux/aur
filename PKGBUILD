# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.3
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

sha512sums_x86_64=('26cdc4d60201840ee82bc7fd13378a9d17724f47ff73aae5bb836f1d9b8fc06c0cf802039d3c8607452684e54f7f625cf145c383b9e439bfcd5ebb7b54a4b74f'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'e981e54d67aa7dcb3197b826e3167054acf6cec2e318a90d3ab4b1818423a2f36e2df8e9263a84bc77ba62aa128c3f7dffc383263f0cfe90c979409159793714'
  '0de4f97e67bd2937f282605f888b4564673673fe6500beb06f2e4e3e9c1edf16786e30a2ea814c1e0de84a2b04f7b0c70cfbc2d54cbca7772e3afda77187d244'
  '73bf27a07d4a16d109433395065a744832a31539bb906db4acefe2406377a1fc4405bf59b5dcca9f3388d5cd50cd2a1e5572d2f8cfe23ad3dd656f8859b3c7b1')
sha512sums_aarch64=('8b3d0129ffffc56a6e8be08656f969a49d314e5f8fc64917539e7745ce2feb43df5ff3faca49385b61925a9626b622482bd95d2e20f75840150f1b83f60ed8fa'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'e981e54d67aa7dcb3197b826e3167054acf6cec2e318a90d3ab4b1818423a2f36e2df8e9263a84bc77ba62aa128c3f7dffc383263f0cfe90c979409159793714'
  '0de4f97e67bd2937f282605f888b4564673673fe6500beb06f2e4e3e9c1edf16786e30a2ea814c1e0de84a2b04f7b0c70cfbc2d54cbca7772e3afda77187d244'
  '73bf27a07d4a16d109433395065a744832a31539bb906db4acefe2406377a1fc4405bf59b5dcca9f3388d5cd50cd2a1e5572d2f8cfe23ad3dd656f8859b3c7b1')

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
