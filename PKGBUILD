# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.10
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

sha512sums_x86_64=('12b5932c198a4fc1029b03cd091fdc1e7e4944d34f55a6995a39a7fe5a68eefa38029faac6b543836c72ab27c9ae9432865eced182c354135f3f70011fed7243'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b6e0920718ea386a13b2fbc1b3fec95ea304e4342784d1c5847765a4c84d8d351ebf9bfad5ab34fc8c5043ffe63cd20bc4245794eaed6c56b098bbeb6fb79118'
  '2fc41e8f09888836a4656102d79aab6e4d89f044f380e48c6126ee833853ffb5140e3e567dbc9e95dec00868e7ef3d94a24a0ee5bdacce85a006178a847fa680'
  '78168d7e5aa1618cac0a595e319e126d933dec2eadcbd4fc3c1bfa97426deb72f383703ac9a910b2c110949a3860e7a204c6d44536a209cf5c26f136055c463c')
sha512sums_aarch64=('d5746b9270a414df2949dd66e581cfdb7b534fa07b1dd4586d991df6c1f15bf546dfc973f237fd5ee4d279922a52494e8bb75d7de1941d5b07bf7884ecb2bd68'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b6e0920718ea386a13b2fbc1b3fec95ea304e4342784d1c5847765a4c84d8d351ebf9bfad5ab34fc8c5043ffe63cd20bc4245794eaed6c56b098bbeb6fb79118'
  '2fc41e8f09888836a4656102d79aab6e4d89f044f380e48c6126ee833853ffb5140e3e567dbc9e95dec00868e7ef3d94a24a0ee5bdacce85a006178a847fa680'
  '78168d7e5aa1618cac0a595e319e126d933dec2eadcbd4fc3c1bfa97426deb72f383703ac9a910b2c110949a3860e7a204c6d44536a209cf5c26f136055c463c')

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
