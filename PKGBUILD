# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boop-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Tiny self-hosted notification inbox for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisgreg/boop"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boop_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boop_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e68ea6a7dec4bf6f8fe6133735b0b1db4ccb4089d5e6b76e9813a1a63f4797a8')
sha256sums_aarch64=('ec5096f514d9fcabef22e4546c0892474d4708f7644b30222621cf61ac95580c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="boop_${pkgver}_linux_amd64" ;;
    aarch64) _dir="boop_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/boop" "${pkgdir}/usr/bin/boop"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
