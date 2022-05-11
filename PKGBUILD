# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.2.0
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

case "$CARCH" in
  arm*) _pkgarch='arm'
    sha256sums+=('31fe9f77bba55470df8edac7a49b80d22e54e5e273a7bc9e854d85b5ea894b3d')
    ;;
  aarch64) _pkgarch='arm64'
    sha256sums+=('62b76bcb760a707fc46dac365536e791f94b83571f3aaaeac27b9bedb85a38aa')
    ;;
  i686) _pkgarch='386'
    sha256sums+=('f2214557be3ceea6a419c58475337bfdaacce1b40c9a7f0394d5809cd1f23d7a')
    ;;
  x86_64) _pkgarch='amd64'
    sha256sums+=('c883c74c633056160539913fba21ad2603fba16e9f23fbb1dc8f9265428c4e30')
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
