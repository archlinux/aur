pkgname=mihomo-party-xs-bin
_pkgname=mihomo-party
pkgver=1.5.13
pkgrel=1
pkgdesc="Another Mihomo GUI. (XiShang distribution)"
arch=('x86_64' 'aarch64')
url="https://github.com/xishang0128/mihomo-party"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-electron" "$_pkgname-electron-bin")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
install=$_pkgname.install
source=("${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-arm64.deb")
sha256sums=('36fc5d388f326ec2304c24c10301bfb80ad194607f7ab692a087f31cc0bfc1e5')
sha256sums_x86_64=('5cc7056a19d5165c653ad64db2cdb61ebf9363748ace707a0b24919f883a1576')
sha256sums_aarch64=('f367fee6f1ef00df1ed78607bb3d9b139e5828aaf70a296eafc9e1c683d7379e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x "${pkgdir}/opt/Mihomo Party/mihomo-party"
    chmod +sx "${pkgdir}/opt/Mihomo Party/resources/sidecar/mihomo"
    chmod +sx "${pkgdir}/opt/Mihomo Party/resources/sidecar/mihomo-alpha"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/Mihomo Party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
