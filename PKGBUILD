# Maintainer: James McMurray <jamesmcm03@gmail.com>

_pkgname="vopono"
pkgname="vopono-git"
pkgver=0.10.14.r0.g4d22055
pkgrel=1
pkgdesc='Run applications through VPN connections in network namespaces'
arch=('any')
url='https://github.com/jamesmcm/vopono'
license=('GPL3')
makedepends=('git' 'rust')
optdepends=('openvpn: for OpenVPN connections' 'wireguard-tools: for Wireguard connections' 'shadowsocks-libev: for Shadowsocks support (Mullvad)' 'openfortivpn: for FortiClient VPN connections' 'libnatpmp: for ProtonVPN port forwarding support' 'trojan: for Trojan Wireguard forwarding support')
source=("git+https://github.com/jamesmcm/${_pkgname}")
provides=('vopono')
conflicts=('vopono')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  CFLAGS+=" -ffat-lto-objects" cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
