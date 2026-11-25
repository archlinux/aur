# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=self-host-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Self-hosted replacements for paid SaaS tools"
arch=('x86_64' 'aarch64')
url="https://github.com/ajnart/self-host"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/self-host_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/self-host_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('3450734d345ad9d8797bfa164fa9a92b3e79ae68528d39aee416df908e6b7bb3')
sha256sums_aarch64=('e8d146a87e22472ed4641d2845ea9a8553e710104a05ebf1205ae0aa02d05993')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/self-host" "${pkgdir}/usr/bin/self-host"
  install -Dm755 "${_dir}/self-host-testkit" "${pkgdir}/usr/bin/self-host-testkit"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
