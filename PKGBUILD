# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('8ee9a8ac1dd4b033125db34ecbdb85b098fa026d60c79d520e32f1317a217cbd')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('55aa8d5d8a8ad96e7cd4a930fd347c86d56405666708c7e5995b605e55b0203d')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('82efb6c514d094c3901e1d6d97fc8c8ab581e243c9e7aa8bfebdd8476e7931d8')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('12558e41533b04a06409d36b33fc1fd19615df5bbbc142a3daa6ec1ece2839ef')
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
