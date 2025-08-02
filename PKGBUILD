# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag='Prod-Beta-3.2.7'
pkgver=3.2.7_beta
pkgrel=2
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
    'bat: for prettier viewing files'
    'less: for viewing files'
)
_license_url='http://gitlab.com/Zillowe/Zillwen/Zusty/Zoi/-/raw/main/LICENSE'

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
              "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
               "LICENSE::$_license_url")

sha512sums_x86_64=('80893110edaef73b80d06d98e076e24a8022134e13256b5d452c5a3b36d5154541fbabdeab4a59cb47e64a74ea4e84e4acf24bdeaf7f89e47e77063bdadcdd93'
                   'b3923750b32ac92a6305437fec688b51fdd2083f2fa51a5a5ac87a0359937e574edf909b02cfc7f26197df730810102572944fe294a0f8f605fe8264ab825afb')
sha512sums_aarch64=('a023b4a3c74ef7a651b441e95b6031f4ada91e9e0cd70cc06aa9df0583ee6531b6848c5cefb465ebf1c37a9ec2796902dc77a147a6cb9215857c93a4162111be'
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
