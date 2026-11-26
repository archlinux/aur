# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xn-ptts-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Phonon text-to-speech inference using xn"
arch=('x86_64' 'aarch64')
url="https://github.com/gradium-ai/xn-ptts"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ptts-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ptts-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4e65eb2028f85565b69d7a7e6d88eef32a38b28d77860d2c75427e33163f4bbf')
sha256sums_aarch64=('721de051ef3fa4d6ed0405f549b8cac596118604f8f63b975313c4debdec76d7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="ptts-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="ptts-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/ptts" "${pkgdir}/usr/bin/ptts"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
