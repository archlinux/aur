# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proqi-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="A terminal-native prompt composer for developers working with coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/oborchers/proqi"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/proqi-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/proqi-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8e8037e9217b0c0bb1818b7508c78155b05b8eb29508d997d855e9b3c709a6dd')
sha256sums_aarch64=('ad0bee04661e236a334619e1aeb0fc665b8afc78ddce08b99c9ebf562873af67')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="proqi-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="proqi-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "proqi" "${pkgdir}/usr/bin/proqi"
  install -Dm644 "completions/proqi.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "completions/_proqi" "${pkgdir}/usr/share/zsh/site-functions/_proqi"
  install -Dm644 "completions/proqi.bash" "${pkgdir}/usr/share/bash-completion/completions/proqi"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
