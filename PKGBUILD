# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag='Prod-Beta-4.3.7'
pkgver=4.3.7_beta
pkgrel=1
pkgdesc="Universal Package Manager & Environment Setup Tool (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zillowe/Zillwen/Zusty/Zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('git')
optdepends=(
    'bash-completion: for bash shell completion'
    'zsh: for zsh shell completion'
    'fish: for fish shell completion'
    'less: for viewing files'
)
_license_url='http://gitlab.com/Zillowe/Zillwen/Zusty/Zoi/-/raw/main/LICENSE'

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
              "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
               "LICENSE::$_license_url")

sha512sums_x86_64=('b8200ef790fb5c2da61f01ff2f203228cac90a073e2b0ba15f9c94c9f3689d60c835e580256059f4ddbb7ca19a7ebd227ecaef7a8ab4d42fa27031d6ddd2782e'
                   'b3923750b32ac92a6305437fec688b51fdd2083f2fa51a5a5ac87a0359937e574edf909b02cfc7f26197df730810102572944fe294a0f8f605fe8264ab825afb')
sha512sums_aarch64=('a049c78faa6555076c4abddfc859e1c9a52e9e5f4cee1c0ef403ed4943ef4363e7547bcc11496dca8c821dfe2662d309aa9fa081a7499ba0739fb66841cd54c1'
                    'b3923750b32ac92a6305437fec688b51fdd2083f2fa51a5a5ac87a0359937e574edf909b02cfc7f26197df730810102572944fe294a0f8f605fe8264ab825afb')

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
