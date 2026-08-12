pkgname=purevpn-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="PureVPN Linux GUI Application"
arch=('x86_64')
url="https://www.purevpn.com/download/linux-vpn"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'openresolv' 'openvpn' 'wireguard-tools' 'net-tools')
optdepends=('libayatana-appindicator: значок в трее')
provides=('purevpn')
conflicts=('purevpn-gui')
options=('!strip')
source=("PureVPN_${pkgver}_amd64.deb::https://apps.purevpn-tools.com/cross-platform/linux-gui/${pkgver}/PureVPN_amd64.deb")
sha256sums=('64c7ccc31c901cccc71fd3e1472f375786cd15f0c6eede854a882f026a568e52')
noextract=("PureVPN_${pkgver}_amd64.deb")

package() {
    bsdtar -x -f "${srcdir}/PureVPN_${pkgver}_amd64.deb" -C "${srcdir}"
    tar -xJf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/PureVPN/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 4755 "${pkgdir}/opt/PureVPN/chrome-sandbox"
}
