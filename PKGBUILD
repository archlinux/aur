# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag='Prod-Beta-3.2.2'
pkgver=3.2.2_beta
pkgrel=1
pkgdesc="Universal Package Manager & Environment Setup Tool (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zillowe/Zillwen/Zusty/Zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'bash-completion: for bash shell completion'
    'zsh: for zsh shell completion'
    'fish: for fish shell completion'
)
_license_url='http://gitlab.com/Zillowe/Zillwen/Zusty/Zoi/-/raw/main/LICENSE'

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
              "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
               "LICENSE::$_license_url")

sha512sums_x86_64=('6ad4ec82769eca5e8ccee2fbd8169ca9c13843d008baf0ff50f807fc4d5d199c848ac7b3c8af159b51229a4b55b57f887bc5ef7f2f0002632f4d3d75d78b70eb'
                   'cc2dd6697f330b0269594e6906577f51846eb317a9f98c4334fad8bdd827f79221d286101ec11f097b56f910396ad6f7831c447e7b40019ecf39c487c65436b9')
sha512sums_aarch64=('7e09fa8c580c0b2bc1bac693d1e16d1890615d0ce1933b636d4b25ca1f7762ee2743e157e942dc1300e1c3c9f3b45ac0b87710279bbf6894fc1dac80ef066d78'
                    'cc2dd6697f330b0269594e6906577f51846eb317a9f98c4334fad8bdd827f79221d286101ec11f097b56f910396ad6f7831c447e7b40019ecf39c487c65436b9')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions bash > "$_bash_completion_dir/${pkgname%-bin}"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions zsh > "$_zsh_completion_dir/_${pkgname%-bin}"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions fish > "$_fish_completion_dir/${pkgname%-bin}.fish"
}
