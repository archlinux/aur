# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.21
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

sha512sums_x86_64=('6827d2fd584ecf9f3fb6b0ad58824adabdee1388fbba43836cd2b91733b581eedc88203c44ff6516a43bcc2e4c765aae439b8ee9c05f36cf6e832f54924231fa'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b7ed98d0183f302f804cfaef2b599b7d1cfd980246d3344b41a1021cd0fa1add8c00d9b76ab0d77d97f76ea2c6cfb0e5cc621bfef532a412c27af32eaeca3512'
  '3646263f4372a6edd0732a4a380bdd0d23de21db11f39503ea3637e5277c0b1363269af3e6eabfd1ea1b7ef5585b85e97f4f013d4c1286399692e849971f8472'
  '82328a6a18dda5efa97fe653e80359046374d35a140cc936332b72f41b0ed12443b1e52fef2b2c0d0c43e254acd9f5d9fc15a8815dea3df17f4cd087736230b4')
sha512sums_aarch64=('f71e2a2c2e052752101c2fc08c0a581443e739ad6c28d0c36b9636da9fd6594ddfb6af2d7a302f21bd16be9038c41c11d3eeb1fc580de45f28428791a393630e'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b7ed98d0183f302f804cfaef2b599b7d1cfd980246d3344b41a1021cd0fa1add8c00d9b76ab0d77d97f76ea2c6cfb0e5cc621bfef532a412c27af32eaeca3512'
  '3646263f4372a6edd0732a4a380bdd0d23de21db11f39503ea3637e5277c0b1363269af3e6eabfd1ea1b7ef5585b85e97f4f013d4c1286399692e849971f8472'
  '82328a6a18dda5efa97fe653e80359046374d35a140cc936332b72f41b0ed12443b1e52fef2b2c0d0c43e254acd9f5d9fc15a8815dea3df17f4cd087736230b4')

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
