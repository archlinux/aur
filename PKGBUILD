# Maintainer: Ben Woodward <ben@benwoodward.me.uk>
# Contributors: slurpee, Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli-beta
_pkgver=2.19.0
_channel=beta
_rel=01
pkgver=${_pkgver}.${_channel}.${_rel}
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${_pkgver}-${_channel}.${_rel}/op_linux_amd64_v${_pkgver}-${_channel}.${_rel}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${_pkgver}-${_channel}.${_rel}/op_linux_386_v${_pkgver}-${_channel}.${_rel}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${_pkgver}-${_channel}.${_rel}/op_linux_arm_v${_pkgver}-${_channel}.${_rel}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${_pkgver}-${_channel}.${_rel}/op_linux_arm64_v${_pkgver}-${_channel}.${_rel}.zip")

sha256sums_x86_64=('0fa520dc979d8ebe32533cc8405cca92be2ef1f7316f8a92365b07b92bc6d7be')
sha256sums_i686=('5bd48ca8aa4a1ae10eca53ec9100c802fab2a92236f962d69e2b81709b335c97')
sha256sums_arm=('2097b3b0f0648af4424ba2ef30835b26c506f1b9e452d546eed43248f5dd5e0d')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('1ef6e58aec60314e5a8e2450f87851280a39bae75563ba0cb06e1f7da7d61ce5')

check() {
  if (( ! SKIPPGPCHECK )); then
    gpg --verify-files ${srcdir}/op.sig
  fi
}

package() {
  install -Dm755 op "${pkgdir}"/usr/bin/op

  install -dm755 "${pkgdir}"/usr/share/zsh/site-functions
  "${pkgdir}"/usr/bin/op completion zsh > "${pkgdir}"/usr/share/zsh/site-functions/_op
}

# vim:set ts=2 sw=2 et:
