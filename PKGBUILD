# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rustinel-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Endpoint detection with Sigma, YARA and IOC rules on native telemetry"
arch=('x86_64' 'aarch64')
url="https://github.com/Karib0u/rustinel"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Karib0u/rustinel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rustinel-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rustinel-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('230cebfbcfec58c42cccf7a52eb38128dc31b41274afd7a08e3222e7868af7f1')
sha256sums_aarch64=('fd4688308fbae88847f5ac31aecf1a198c8b3b801ad143cde484992860d43747')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rustinel-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="rustinel-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/rustinel" "${pkgdir}/usr/bin/rustinel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
