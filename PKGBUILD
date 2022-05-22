# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.3.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('77b00b5d655baf90ed8cb7ff1a7410f0922a3a24804312455cd1ec2a83221111')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('0261238d4b9db136bc43c3b304c685600e617858e0c676330b3d4ef0a25f5c99')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('58294b35f65f42035090bac61afba9d700865e1be12eb0bb3406079cbb2d3618')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('6239f057bcf9f6e7cac22e22ee9513d29d300f12fca3e846661c42bf18ab2be8')
    ;;
esac

source+=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_${_pkgarch}_v${pkgver}.zip")

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op

  install -d 755 "${pkgdir}"/usr/share/zsh/site-functions
  "${pkgdir}"/usr/bin/op completion zsh > "${pkgdir}"/usr/share/zsh/site-functions/_op
}

# vim:set ts=2 sw=2 et:
