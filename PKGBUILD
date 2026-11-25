# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rtail-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Stream terminal output to the browser using UNIX pipes"
arch=('x86_64' 'aarch64')
url="https://github.com/kilianc/rtail"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rtail_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rtail_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e498d8d0b402da032d208cf98fc6f328939187f70347d5b68f4fd29fa0981b43')
sha256sums_aarch64=('0da2f07809c29ba78f33a4b775045acc1e2ec0585b8336997bb17036983a4754')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rtail_${pkgver}_linux_amd64" ;;
    aarch64) _dir="rtail_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/rtail" "${pkgdir}/usr/bin/rtail"
  install -Dm755 "${_dir}/rtail-server" "${pkgdir}/usr/bin/rtail-server"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
