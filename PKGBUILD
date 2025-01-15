pkgname=mihomo-party-xs-bin
_pkgname=mihomo-party
pkgver=1.6.0
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
sha256sums_x86_64=('15432d4d2e3cb1933c493b18a69178630f3af8637063d6e3f3dc728fa5892f29')
sha256sums_aarch64=('b1584168e1b3b3708ff6b5731720f2da2229885daacc7d5fb79d375e9a734503')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x "${pkgdir}/opt/Mihomo Party/mihomo-party"
    chmod +sx "${pkgdir}/opt/Mihomo Party/resources/sidecar/mihomo"
    chmod +sx "${pkgdir}/opt/Mihomo Party/resources/sidecar/mihomo-alpha"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/Mihomo Party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
