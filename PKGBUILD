# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.15
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

sha512sums_x86_64=('c3f99dd884281d7f7432a2e953042b5d55fc1ef2e9cb69575412fa4eb6c0fa61d947b34c164c8cdd29bd4eb2af8472f7d53e8201cfaa6958a93e67d0da695ad6'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'f1afe7486292cc3153396caa3ca0c66f186bb8426de3792b9ede15bb18deef3f9eff89059f9587752a8cf554b8e8f76e95c9ea7fae21d864b3637474c3e27592'
  '754d935cab15b9133be32395249409c4d97021302ba5ad092a95ad1183228e0e5f0144077e72ec32cd742f72371e74f36e2683bd898b541491e51ed09b6eab23'
  '8896f3150886e1e263ce7f3ddd20df3b89e66bb4aec4861b757285e19a5eb3460599c6183c55a0ce03f89a7a38e09a45e1271108c6f649f4ed2d38d3ed06951e')
sha512sums_aarch64=('177667322449c54c84bfe02be1c13ef8367a5e155c4c94a85d9391a240675458dfa238c0de5d6c73bc8ae164bc51a5f9d2e83129c8fc10203e86c11c3c455ef8'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'f1afe7486292cc3153396caa3ca0c66f186bb8426de3792b9ede15bb18deef3f9eff89059f9587752a8cf554b8e8f76e95c9ea7fae21d864b3637474c3e27592'
  '754d935cab15b9133be32395249409c4d97021302ba5ad092a95ad1183228e0e5f0144077e72ec32cd742f72371e74f36e2683bd898b541491e51ed09b6eab23'
  '8896f3150886e1e263ce7f3ddd20df3b89e66bb4aec4861b757285e19a5eb3460599c6183c55a0ce03f89a7a38e09a45e1271108c6f649f4ed2d38d3ed06951e')

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
