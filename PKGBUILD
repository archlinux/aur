# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.7.2
pkgrel=1
pkgdesc="1Password command line tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://app-updates.agilebits.com/product_history/CLI2"
license=('custom')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
source_i686=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_386_v${pkgver}.zip")
source_arm=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm_v${pkgver}.zip")
source_armv6h=("${source_arm}")
source_aarch64=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_arm64_v${pkgver}.zip")

sha256sums_x86_64=('8d5999f3c4d94d1f78f54415e9b247fe7134ea31c257059d96e5b39a5d66f331')
sha256sums_i686=('8b3dbd4c44d0de4e9e3ba013b51d536fad3a02f22ea576bc37581ea14ef067eb')
sha256sums_arm=('f130150d9a5c0d0a34e26d7c45254eb10fc3e39b437b7f4ba6f0c88ab63cc2d3')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('239f8cfa1c20fd455a9a474c4bc85d8897c5cb6933c5bb6bdc833ab9426fc976')

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
