# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=smokescreen-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="HTTP proxy that blocks requests to disallowed URLs"
arch=('x86_64' 'aarch64')
url="https://github.com/stripe/smokescreen"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/smokescreen_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/smokescreen_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6021eda5f2c95e37c7fc1966debccf3714f8740e2784ed9e9d0087b21a0ccf06')
sha256sums_aarch64=('7ed3439acf77522a052b042defc0efd4dbf854a3aa3795dcdd864f1560a990fe')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="smokescreen_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="smokescreen_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/smokescreen" "${pkgdir}/usr/bin/smokescreen"
  install -Dm644 "${_dir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
