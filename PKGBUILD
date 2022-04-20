# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.0.0
pkgrel=4
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('d2977e252a4ca650a43a2578fdf5d4d4d024eab4b3191890457c890ba34fcba9')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('dce1481a66b5e537b38a0a9d76a3306cb28a8ec00920bd2c142f8d08075bc751')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('fa922e35b24c784f06fffd23ab5aef710b132a8d952dd8cf8d58e98423625000')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('5087e99c8b0bde941ef34034009fe289b5c2f5b36da3a2c2fa24a2b5a2497083')
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
