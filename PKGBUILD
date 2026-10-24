# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=tun2proxy-bin
pkgver=0.8.6
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
sha256sums_x86_64=('1bbf9d1994d0fd4889a7d4b0950af7ee7b1488940e769fc1a1d74f386f9cee92')
sha256sums_aarch64=('8dca73e3945b931882467cfcadc2a82018ece78a28f25d6d4d1e7613c266b493')
sha256sums_i686=('7f2996d7805ae1b3d3afdc87961b48507e6209ccc8dd1c8ef5cce63d35a7a9b1')
sha256sums_armv7h=('4c48f91a814e6cf63a80417757af7c94c2a21b2b41201b978199cd21432b8d85')
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