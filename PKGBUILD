# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=books-for-bots-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Convert EPUBs into navigable Markdown for LLM agents"
arch=('x86_64' 'aarch64')
url="https://github.com/prime-radiant-inc/books-for-bots"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/books-for-bots-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/books-for-bots-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('b01b8432c8ba6e7275895861427be1d7d3ac8e83199e63009b1aa6fe58e8043d')
sha256sums_aarch64=('c32f423dc9e09ad228ee223cde184f4a1cae7fd333f302145141190cc43e6ce0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="books-for-bots-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="books-for-bots-v${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/books-for-bots" "${pkgdir}/usr/bin/books-for-bots"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
