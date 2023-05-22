# Maintainer: slurpee <aur@lylat.io>
# Contributors: Felix Seidel, Claudia Pellegrino, Liu Yuxuan

pkgname=1password-cli
pkgver=2.18.0
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

sha256sums_x86_64=('2baf610b476727f24c62cc843419f55b157e1a05521a698c1c8b4ed676a766aa')
sha256sums_i686=('7b755242f36b8bf51633d39f00e9a611a7c052bf4b2eeb8b9b138444b4f4d516')
sha256sums_arm=('75796f2e897cad52c2c09400709d9c1a193b71507d7d9266966259d3d2dbb7b9')
sha256sums_armv6h=("${sha256sums_arm}")
sha256sums_aarch64=('b93a8e0dc42c0979bb13047ac4412bd73092be57bb84ad223eeca295151159fa')

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
