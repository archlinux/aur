# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=orbien-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Intranet penetration tunnel for TCP, HTTP, UDP and SOCKS5 over QUIC, WebSocket and mTLS"
arch=('x86_64' 'aarch64')
url="https://github.com/lxien/orbien"
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lxien/orbien/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/orbien_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/orbien_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('8e82c8b62190605b62af6f0cd066c98cfafaff7b1b8a7c723b8b99f1e681cf90')
sha256sums_x86_64=('0f8861d7098a0ce2a7e32ed8e32e5a396949219a825a0cfe9859d3668895badb')
sha256sums_aarch64=('794a55e737084d272bac839bfe74d312aa74b9080c2a3f9a35379a87ea2412cf')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="orbien_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="orbien_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/orbien" "${pkgdir}/usr/bin/orbien"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
