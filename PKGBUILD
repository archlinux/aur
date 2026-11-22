# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rigtop-bin
pkgver=0.35.1
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
sha256sums_x86_64=('eb529b56765c04d2e63cf002542188fc925fa7556e7871b8160c4d8737cc5df6')
sha256sums_aarch64=('0b81fbd38a991c803cc533d33b96889c1e31fd267fb5d2d4b0429ed1d83b7faf')

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
