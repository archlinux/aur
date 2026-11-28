# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gohawk-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Static analyzers for Go concurrency and resource-lifetime bugs"
arch=('x86_64' 'aarch64')
url="https://github.com/kojah/gohawk"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gohawk_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gohawk_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5fae67568188d0a9fe116452b8666715c6fb14e5db7d996f444ae3798c197587')
sha256sums_aarch64=('30dba94c3fcd8a23cd5e55023c1abb6704cf6e45c2ec49fe1b42427dac51e45b')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gohawk_${pkgver}_linux_amd64" ;;
    aarch64) _dir="gohawk_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/gohawk" "${pkgdir}/usr/bin/gohawk"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
