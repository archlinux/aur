# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=droidline-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="Android automation from code"
arch=('x86_64' 'aarch64')
url="https://github.com/KnifeLemon/Droidline"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/droidline_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/droidline_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('43c07866334a33ac259aa16d895cb773b91823df4bf43c33b761efcaa4c67657')
sha256sums_aarch64=('0d3c694f63b60f95b9ab05203627eb25c84e5ed2b813e4421f8ef6e4fd3ac2db')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="droidline_${pkgver}_linux_amd64" ;;
    aarch64) _dir="droidline_${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/droidline-fakephone" "${pkgdir}/usr/bin/droidline-fakephone"
  install -Dm755 "${_dir}/droidline-relay" "${pkgdir}/usr/bin/droidline-relay"
  install -Dm755 "${_dir}/droidline" "${pkgdir}/usr/bin/droidline"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
