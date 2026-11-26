# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mithril-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="IoT static scanner for secrets, SBOMs and CVEs"
arch=('x86_64' 'aarch64')
url="https://github.com/nmatt0/mithril"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mithril-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mithril-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('e8c62f3b67c85786d75a09d6019eb243a9a2623db611150bbc0d27b0deca66d0')
sha256sums_aarch64=('fb56e5fb72ba057b40867ec6c92bf5f1b7699f5b3c34a04477cd64785e80af6b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="mithril-v${pkgver}-linux-x86_64" ;;
    aarch64) _dir="mithril-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/mithril" "${pkgdir}/usr/bin/mithril"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
