# Maintainer: LittleYe233 <littleye233 at gmail dot com>
# Contributor: BigmenPixel <bigmen dot pixel at tuta dot io>

pkgname=tun2socks-bin
_pkgname=tun2socks
pkgver=2.4.1
pkgrel=1
pkgdesc="tun2socks - powered by gVisor TCP/IP stack"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/xjasonlyu/tun2socks"
license=('GPL3')
makedepends=()
conflicts=("tun2socks")

source=("config.yaml" "${_pkgname}.service")
source_x86_64=("${_pkgname}-linux-amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip")
source_i686=("${_pkgname}-linux-386-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-386.zip")
source_armv7h=("${_pkgname}-linux-armv7-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-armv7.zip")
source_aarch64=("${_pkgname}-linux-arm64-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip")

sha256sums=("33e1d59671dd21199b241313658d5ec23ef65c79586d1108d7237362458f5329"
            "877cd2b80c5c4065b5828fa470754e5c812110ffbf545c9471f63b651a2808c7")
sha256sums_x86_64=("4e025470453cc0b4c72b384b1441ecbeba1cf3b2ae98837ba630aa5102d1b6d0")
sha256sums_i686=("ac208550f9e5497ef437b924f8e284359c7cdff98f2d1924d212821ae544940d")
sha256sums_armv7h=("1182b15d8277fa6ea660c74b71599cb2417bdc28c889215514f414978a26a9d3")
sha256sums_aarch64=("74200b1f738a038ff90ec70377feb61c978487c71b2a9468d827c188fc33a900")

package() {
  declare -A ARCH_MAP
  ARCH_MAP=( [x86_64]='amd64' [i686]='386' [armv7h]='armv7' [aarch64]='arm64' )
  _execname="${_pkgname}-linux-${ARCH_MAP[${CARCH}]}"

  install -Dm755 "${srcdir}/${_execname}"           "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 "${srcdir}"/config.yaml         -t "${pkgdir}"/etc/tun2socks
  install -Dm644 "${srcdir}/${_pkgname}".service -t "${pkgdir}"/usr/lib/systemd/system
}
