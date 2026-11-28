# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=live777-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Low-latency WebRTC SFU with RTP/RTSP gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/binbat/live777"
license=('MPL-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/live777-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/live777-v${pkgver}-aarch64-linux-android.tar.gz")
sha256sums_x86_64=('83b5780c0efeb0a06a6d568c9a176b45269492ad88418918655bbd011cb33d9a')
sha256sums_aarch64=('b380b60e314dce6ed9458af1a0ea58bb1d96d433b85f26dd6f6e0f1da9a2ae07')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="live777-v${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="live777-v${pkgver}-aarch64-linux-android" ;;
  esac
  install -Dm755 "${_dir}/live777" "${pkgdir}/usr/bin/live777"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
