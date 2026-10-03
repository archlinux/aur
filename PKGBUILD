# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from DeepSeek V4 Flash.

pkgname=tun2proxy-bin
pkgver=0.8.4
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
sha256sums_x86_64=('f82c472a97fd686ab0ea5ecea7aead43c272ac66574d9cac02bc36e632df7b84')
sha256sums_aarch64=('18c098532622dee85249c48cad0c128728d536a6c63c95c60eb43d62e235353f')
sha256sums_i686=('84d8548fde66abf605ffbb6023fe021c6784566a7fb84a4c1ee4dfe2889c05aa')
sha256sums_armv7h=('ea58aeef94d76d3799c27c4731896ed04923d2238d9d0d2b417ed3e774c82658')
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