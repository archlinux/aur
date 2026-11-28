# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=encoderfile-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Distribute and run transformer encoders as a single file"
arch=('x86_64' 'aarch64')
url="https://github.com/mozilla-ai/encoderfile"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/encoderfile-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/encoderfile-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d2fe6032b3cbc468244b260dc6508be509f0b240ce8378284336fdc03edc7f19')
sha256sums_aarch64=('2388434bb4a66e7bca8bf88203f6b0d2b7a205b00fffad77f712a9fb35729e4e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/encoderfile" "${pkgdir}/usr/bin/encoderfile"
  install -Dm755 "${_dir}/encoderfile-runtime" "${pkgdir}/usr/bin/encoderfile-runtime"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
