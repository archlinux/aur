# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.3.1
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('732b903d2ef2b4a8cedbbdc063a796621c6786124f16403c4a311613c81e91a1')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('47e78fc2128a8181ff797b814b40ddcc8e5e1d39c11c037fa962d3162e42c8e9')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('59e6ec64df969981820ac0c0d88533d62407c68751617d12c89814c9c959ae7a')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('453d5333b29aec941cdfe6cbd4590ec101b3e2e356c51e469483c364dac190e2')
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
