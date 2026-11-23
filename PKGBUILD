# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rigtop-bin
pkgver=0.36.2
pkgrel=1
pkgdesc="System monitor for workstations, laptops and NAS with storage health, per-process GPU memory"
arch=('x86_64' 'aarch64')
url="https://github.com/akivajp/rigtop"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rigtop-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rigtop-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c4849d2d00757167d8b50c196be15fbdbd252c8a7fefa229fdbadf61d751016e')
sha256sums_aarch64=('df99440ac3c1e47f049b95af0c1dd6e7f54f7f04356d70c299a8ed7e328847d9')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rigtop-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="rigtop-v${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "rigtop" "${pkgdir}/usr/bin/rigtop"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.ja.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
