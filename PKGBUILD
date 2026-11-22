# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.29.16
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

sha512sums_x86_64=('9ab14ff9fa152ac333e9011b4f2b0d4bec6b26b9fd2e89a82ec945330d05d14580e3cb6893cdbd5463d8fc5939fd0b31134a304a64d2c80cd6617184e2bfab72'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7af3cb5a78b92a5d6ba348200d1868ef6f8364ffcb1389afdbeed93cc3d62180798628f702012fee67ec59049142ddecf33c3a3b194b2879c6618d42dfca207d'
  'bd5854faf699aa50ae57b8c6124dfd60eb58eff31b2cd225316e3a227f365224f0cdaa5e7af80e208931d2b4344006e99530c4cbc960e8ad327584a10d5775f0'
  '2d5cf6b3cca5b7283cbea233b1b1b75c54a928dbc823f939ca704d1440f18d8d578e7bff3ad43f100371a7f10fce0d8ad33264b8617417f53181cae4330dab58')
sha512sums_aarch64=('6b895cfe94fdf098f11f955ab5f4bd256237c8a3a12bc4e7bd04e6ce28f96273c61fbbc10edc0c792c61f80fd9030648d396a2b979e07cf0f6fba5a4d6b932ea'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '7af3cb5a78b92a5d6ba348200d1868ef6f8364ffcb1389afdbeed93cc3d62180798628f702012fee67ec59049142ddecf33c3a3b194b2879c6618d42dfca207d'
  'bd5854faf699aa50ae57b8c6124dfd60eb58eff31b2cd225316e3a227f365224f0cdaa5e7af80e208931d2b4344006e99530c4cbc960e8ad327584a10d5775f0'
  '2d5cf6b3cca5b7283cbea233b1b1b75c54a928dbc823f939ca704d1440f18d8d578e7bff3ad43f100371a7f10fce0d8ad33264b8617417f53181cae4330dab58')

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
