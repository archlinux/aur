# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fishtanks-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="An ASCII aquarium for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/daniel-retamal/fishtanks"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/fishtanks-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/fishtanks-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('ca39a860d57fe82f1bed9ed45520debed62d7931ace2b5ed78506efa7d6cf918')
sha256sums_aarch64=('c68fc744fcbe79759b182c0fb2bff1502e0a87f1dbb1d3bdf7409c8d8362c8e4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="fishtanks-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="fishtanks-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "fishtanks" "${pkgdir}/usr/bin/fishtanks"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
