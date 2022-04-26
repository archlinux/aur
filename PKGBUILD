# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('d955106fec417b0dcb4f667d7e8c201aa32b926a8a9edb1433d85e0d437a4f3a')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('1b5df363df03ddf13ca48f84fc4dbc1d15fa78aeea79164075dd3de4cb2c2d42')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('200fea9d0d7a980f09dd621d939305a6303990927af98daf754aad430615b183')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('5e8ea61a7d952e769f42f07a1d55252680ee946761c4b378b61014b6864772ee')
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
