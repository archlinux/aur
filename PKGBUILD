# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.26
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

sha512sums_x86_64=('9713ab8c16585d57c2732c7b8fe82ddb43badf1560d6772b2eceed5ef4274f2f379a6480a2e6ef4da71464583ab408d766b9e5ca6eecf087a4fd575c90554573'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7e4f150a23e2f4f339125858bdf08e7b311cb58ca6403f4a545ec536e8bf24d5792a19081a9bc8c247cd49688268bc5e6b060279f6ddb01cddfd78c608a6f91c'
  'fdd037505dcb897dc996c109f20008ca5c8b985671b16cc16a004f9bbdc7159cd4af8ea65725919e291286462f27c01d44dc92ca3eea6e008cfdeebb2f9c9f94'
  '4eee6d9b77e69eb866e40fd516fdc5cfe6d9366dfe84d11bbd6c02fe1736a2b8d77dedfbe954c351d5aeceff5e570f71258393018fad28aac681b63cfcf97ca1')
sha512sums_aarch64=('9cf5c4172de9daf40f0bc76aae6d513a46d1de06f326d841297792b3ccb7790a73185f289cc3795fc2dc303538e035f4e43b8b7d3f0c68a0fdac41b36badccf0'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7e4f150a23e2f4f339125858bdf08e7b311cb58ca6403f4a545ec536e8bf24d5792a19081a9bc8c247cd49688268bc5e6b060279f6ddb01cddfd78c608a6f91c'
  'fdd037505dcb897dc996c109f20008ca5c8b985671b16cc16a004f9bbdc7159cd4af8ea65725919e291286462f27c01d44dc92ca3eea6e008cfdeebb2f9c9f94'
  '4eee6d9b77e69eb866e40fd516fdc5cfe6d9366dfe84d11bbd6c02fe1736a2b8d77dedfbe954c351d5aeceff5e570f71258393018fad28aac681b63cfcf97ca1')

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
