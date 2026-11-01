# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.

pkgname=tun2proxy-bin
pkgver=0.8.7
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
sha256sums_x86_64=('b6c4c68cb5e639f779665295286797cdc6f01c506452bc629a17288e210f77d4')
sha256sums_aarch64=('e9d7aaa265ccb4f8fa12c1e6438debee6a20abc36175e304bbf3b7197c63fb33')
sha256sums_i686=('8e92a1a34430468b47a84907f723f45051cd949c90c2109c5ff334a55de72902')
sha256sums_armv7h=('0faf2384052bc6202e0a2b37f4b4c78cb5c0549aa0f99411d5b84cc2ed575053')
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