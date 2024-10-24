pkgname=mihomo-party-bin
_pkgname=mihomo-party
pkgver=1.5.4
pkgrel=1
pkgdesc="Another Mihomo GUI."
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/mihomo-party"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-electron" "$_pkgname-electron-bin")
conflicts=("mihomo-party-git" 'mihomo-party')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: Allow mihomo-party to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
install=$_pkgname.install
source=("${_pkgname}.sh")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/mihomo-party-linux-${pkgver}-arm64.deb")
sha256sums=('f8049c1f26d5a92fbcebd7bebbdedbb3eab53422b21cf6127418251ccd061282')
sha256sums_x86_64=("69d998cd9a5f466139c791954467cb62fcf8d0150f010363f34f1910873d91db")
sha256sums_aarch64=("7c29356fc9a105ce0c83e08a1a7b5a9d549cff5260170abca88b58859f045342")

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-party/mihomo-party
    chmod +sx ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-party/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/mihomo-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
