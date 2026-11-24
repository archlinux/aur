# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dfdisk-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Modern forensic disk imaging, damaged media rescue and evidence management"
arch=('x86_64' 'aarch64')
url="https://github.com/tylerstyle/dfdisk"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dfdisk-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/dfdisk-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b3f7e04b616e3ee685a47e435f5b96168ca81d5520fb60754be05187edbdefa2')
sha256sums_aarch64=('20024af3453669a52ab2b65e28c066af1f055e7aa5a485c937afe0e7092e105d')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="dfdisk-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="dfdisk-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "dfdisk" "${pkgdir}/usr/bin/dfdisk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
