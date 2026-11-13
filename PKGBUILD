# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.13
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

sha512sums_x86_64=('b85f9997d809e0c8d0dcfc17ffed7d7a8ee13ae922cd7a5029d28d9eff90a2a156b5a94fac2dee32f141e58e4ace18fbefdb2df0d80916168997dfb7849d2fa8'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'c77b3ef6dd37c10dbcd04629e8193a4ce3c082b7c298c191d7fdf9cb3899d7c9e8f283eb1f6edb22b3b23df00fc05029ef7711ab90f29569971db326c1714d09'
  '6a354ca8382525d288f72bb0789c0319818e860500f822aa46b6f380773e4153afeb159167efa4ac8a473f483fc035f88fd73bc6a5b61a40fdf5c43b1e32a5f2'
  'e07d024fb4bf751bd48326c8e7644f66f4dcbd6da740ec62b363a6cf0ae0f9a1c4713090bcf388777cec8c91f652dd443acd6e3cbbdefffedd3c84ca995b9e4d')
sha512sums_aarch64=('bdc0bc462e6c4496c97e623c8b19bf2bfb00051c270ff8c9e17ef126f149c3e4177f50705ef8663629617ade440dbbf547d9eaea32577cb0dbbe7aa01c34f330'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'c77b3ef6dd37c10dbcd04629e8193a4ce3c082b7c298c191d7fdf9cb3899d7c9e8f283eb1f6edb22b3b23df00fc05029ef7711ab90f29569971db326c1714d09'
  '6a354ca8382525d288f72bb0789c0319818e860500f822aa46b6f380773e4153afeb159167efa4ac8a473f483fc035f88fd73bc6a5b61a40fdf5c43b1e32a5f2'
  'e07d024fb4bf751bd48326c8e7644f66f4dcbd6da740ec62b363a6cf0ae0f9a1c4713090bcf388777cec8c91f652dd443acd6e3cbbdefffedd3c84ca995b9e4d')

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
