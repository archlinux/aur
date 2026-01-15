pkgname=mihomo-party-bin
_pkgname=mihomo-party
pkgver=1.9.0
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
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-party-linux-${pkgver}-amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-party-linux-${pkgver}-arm64.deb")
sha256sums=('242609b1259e999e944b7187f4c03aacba8134a7671ff3a50e2e246b4c4eff48')
sha256sums_x86_64=("00b0026f01fd8281fd8da40ef5cbb8d1ddeadf1b9841146b85cc6407f9869a49")
sha256sums_aarch64=("725238aa321d6569e05f168cd4994390fa46eeca83d573f55fc6c0a2650ed1de")

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/clash-party/mihomo-party
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-alpha
    chmod +sx ${pkgdir}/opt/clash-party/resources/sidecar/mihomo-smart
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/clash-party/mihomo-party!mihomo-party!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
