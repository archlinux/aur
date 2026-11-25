# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pogocache-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Low-latency, CPU-efficient caching server"
arch=('x86_64' 'aarch64')
url="https://github.com/tidwall/pogocache"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pogocache-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pogocache-linux-arm64.tar.gz")
sha256sums_x86_64=('5e7d35e479446b84f37187808a47f3de048732ec02f2fcaec9932d8ddf4545d9')
sha256sums_aarch64=('51b2cd50cf19b58ba2769fb39c47dd54241c100d02f1359706bdba41752e4063')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="pogocache-linux-amd64" ;;
    aarch64) _dir="pogocache-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/pogocache" "${pkgdir}/usr/bin/pogocache"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
