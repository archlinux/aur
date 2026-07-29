# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=tun2proxy-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Tunnel (TUN) interface for SOCKS and HTTP proxies — prebuilt binary"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/tun2proxy/tun2proxy'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('tun2proxy')
conflicts=('tun2proxy')
options=('!strip' '!debug')

source_x86_64=("tun2proxy-x86_64.zip::https://github.com/tun2proxy/tun2proxy/releases/download/v${pkgver}/tun2proxy-x86_64-unknown-linux-gnu.zip")
source_aarch64=("tun2proxy-aarch64.zip::https://github.com/tun2proxy/tun2proxy/releases/download/v${pkgver}/tun2proxy-aarch64-unknown-linux-gnu.zip")
source_i686=("tun2proxy-i686.zip::https://github.com/tun2proxy/tun2proxy/releases/download/v${pkgver}/tun2proxy-i686-unknown-linux-musl.zip")
source_armv7h=("tun2proxy-armv7h.zip::https://github.com/tun2proxy/tun2proxy/releases/download/v${pkgver}/tun2proxy-armv7-unknown-linux-musleabihf.zip")
source=("LICENSE::https://raw.githubusercontent.com/tun2proxy/tun2proxy/master/LICENSE")
sha256sums_x86_64=('b5c3a387448ffe375ed94e0403c92a40e650e801c26eee633896e142115aa869')
sha256sums_aarch64=('b6f5a87f3fee2ba483b06cf987fb058ca7a835ee47b17b098aa2c0d4ce70aa52')
sha256sums_i686=('a08ebfdd7308d851d743c27d5b5984d5cc23dede822a869bc612629428f55c8d')
sha256sums_armv7h=('78b60f519f8d07dd60b97cb65d501efa11da7d326ce46bb919a2c5b440c8e2b0')
sha256sums=('8cddc80ccbbb14a8a3d7fee1fc1795d7fcd647f4c7063ad95246f9ff24b407c7')

package() {
  local _arch="${CARCH}"
  [[ "${_arch}" == "armv7h" ]] && _arch="armv7h"
  local _zip="${srcdir}/tun2proxy-${_arch}.zip"

  bsdtar -xf "${_zip}" -C "${srcdir}"

  local _dir="${srcdir}"

  install -Dm755 "${_dir}/tun2proxy-bin" "${pkgdir}/usr/bin/tun2proxy"
  install -Dm755 "${_dir}/udpgw-server" "${pkgdir}/usr/bin/udpgw-server"

  install -Dm644 "${_dir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}