# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xylem-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="An XTree/ZTreeWin-style file manager with a directory tree, tagging, batch operations"
arch=('x86_64' 'aarch64')
url="https://github.com/andrelnfernandes/xylem"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xy-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('32257926c4462da67f44607398cfe99564ffab27d3e18970b1d6755eef28b536')
sha256sums_aarch64=('495731d6056f0137b35f20ddb54a05a399c946f1ea70df22b5f3e3d3fa2c1cf4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="xy-v${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="xy-v${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "xy" "${pkgdir}/usr/bin/xy"
  install -Dm644 "xy.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
