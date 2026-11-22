# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=forgetop-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Pull requests, work items, and CI pipelines from GitHub, GitLab, Azure DevOps, Bitbucket, Linear"
arch=('x86_64' 'aarch64')
url="https://github.com/magna-nz/forgetop"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/forgetop-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/forgetop-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('5741ced894059bc3cc2f628b40a80fb31bb602c94f009a56ad5244af5de0bd85')
sha256sums_aarch64=('56a1cca35debd9be04bae88b09128322e13532316a7550cca55f5f01b3c1a1dc')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="forgetop-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="forgetop-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "forgetop" "${pkgdir}/usr/bin/forgetop"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
