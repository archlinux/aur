# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.14
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

sha512sums_x86_64=('7717009f601e7f6fbdf1bca021aca8157d94b4571472197ecc38e6d2859d9c9c20ae71ba8b71b243d2ada96261ffe44abd019654e67561b071573e5fcd95951a'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'a6bf9e3356a2023604e986e2da25c96436beb5e0d6eecb47ab80e353223e221768bd33ef2c05c34f34c21df79ad7543dfe09849f7a63732e5eaff597ff3ace68'
  '3a265523d803725b3af85e8278ca162800b38499da983d0cc319b29448d507cf1bcd36e4da0b8ccd4f2476180b6faceab22c41d83b07b0123a90090b8b9e7fb8'
  'b48f95276b1140ad2a5aad00125dcd65825c932327ef38cc3fdce8890b9d8c83896808393d3f642b93228d377165c82483b7acb132699f725c25ad057e9d13f0')
sha512sums_aarch64=('2ff5f5d9306cdc817dd57ef82d91aa3725b3ba364a4889d80c229e24e539ea129e628e553f0191eb80e55fdaa8f6ab05bfb4f2758632176224cdbf79d1de4ff3'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'a6bf9e3356a2023604e986e2da25c96436beb5e0d6eecb47ab80e353223e221768bd33ef2c05c34f34c21df79ad7543dfe09849f7a63732e5eaff597ff3ace68'
  '3a265523d803725b3af85e8278ca162800b38499da983d0cc319b29448d507cf1bcd36e4da0b8ccd4f2476180b6faceab22c41d83b07b0123a90090b8b9e7fb8'
  'b48f95276b1140ad2a5aad00125dcd65825c932327ef38cc3fdce8890b9d8c83896808393d3f642b93228d377165c82483b7acb132699f725c25ad057e9d13f0')

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
