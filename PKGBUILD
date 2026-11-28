# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openfirma-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Policy enforcement sidecar for AI agent outbound calls"
arch=('x86_64' 'aarch64')
url="https://github.com/Firma-AI/openfirma"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/firma-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/firma-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0c14ed8cf485cc3ba0aada80d53191eb3c17a9bb35d5469b567f975cdada5849')
sha256sums_aarch64=('0a1597915e8f3b432c83f6123dac5fa0d549967ad4814520c97ee0ff924f8ea8')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="firma-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="firma-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/firma" "${pkgdir}/usr/bin/firma"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
