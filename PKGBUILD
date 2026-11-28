# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.23
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

sha512sums_x86_64=('62c147319da992e6c87e66c42df24da255cac9563a9fec48b79c23679e950dfcc7b82fca291020c077e2168c06b8334e0d395c8c2b2ac4c27da02a213eda1a0f'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '6a7e95d11d8c520b503e7ba6a0349e5e0e3d2c46367cd9121e3eb7a011b89a5674776957f96b5341276503018d68fe2d3857502d47337d6d0f8bceb8e5e54346'
  '63b2548aa4283cbea7b6d57a3ba7ac3fbdcde9e8d5a170ed73ade1b2e6987fa11ca5ec26fe8e7dd63c8318d3144add035ef05be88777d461cfea48d979b66f59'
  '138a4a6b1725298cfcf1387b5522ec10f36497927d02159e76172e8a662a5aa4647e58415acf9671b69fa51b0bcbffd5ba60cdd391f8f9a16117254bfc1488d6')
sha512sums_aarch64=('1ec57eb9e6646bb396605f0a3930d4f6527037ce67f906a015840a712b703823d8f2429e6d7946bb18c589094ab3313e746b67f230d3290317600384f676a128'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '6a7e95d11d8c520b503e7ba6a0349e5e0e3d2c46367cd9121e3eb7a011b89a5674776957f96b5341276503018d68fe2d3857502d47337d6d0f8bceb8e5e54346'
  '63b2548aa4283cbea7b6d57a3ba7ac3fbdcde9e8d5a170ed73ade1b2e6987fa11ca5ec26fe8e7dd63c8318d3144add035ef05be88777d461cfea48d979b66f59'
  '138a4a6b1725298cfcf1387b5522ec10f36497927d02159e76172e8a662a5aa4647e58415acf9671b69fa51b0bcbffd5ba60cdd391f8f9a16117254bfc1488d6')

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
